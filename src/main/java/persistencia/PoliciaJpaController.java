/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package persistencia;

import java.io.Serializable;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.Persistence;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import logica.Policia;
import persistencia.exceptions.NonexistentEntityException;

/**
 *
 * @author jonii
 */
public class PoliciaJpaController implements Serializable {

    public PoliciaJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    PoliciaJpaController() {
        emf = Persistence.createEntityManagerFactory("RegitroDetenidosPU");
    }

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Policia policia) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(policia);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Policia policia) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            policia = em.merge(policia);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                int id = policia.getId();
                if (findPolicia(id) == null) {
                    throw new NonexistentEntityException("The policia with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(int id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Policia policia;
            try {
                policia = em.getReference(Policia.class, id);
                policia.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The policia with id " + id + " no longer exists.", enfe);
            }
            em.remove(policia);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Policia> findPoliciaEntities() {
        return findPoliciaEntities(true, -1, -1);
    }

    public List<Policia> findPoliciaEntities(int maxResults, int firstResult) {
        return findPoliciaEntities(false, maxResults, firstResult);
    }

    private List<Policia> findPoliciaEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Policia.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public Policia findPolicia(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Policia.class, id);
        } finally {
            em.close();
        }
    }

    public int getPoliciaCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Policia> rt = cq.from(Policia.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }

    public Policia buscarPorLegajo(String numeroLegajo) {
        EntityManager em = getEntityManager();
        try {
            Query query = em.createQuery("SELECT p FROM Policia p WHERE p.numeroLegajo = :legajo");
            query.setParameter("legajo", numeroLegajo);
            return (Policia) query.getSingleResult();
        } catch (javax.persistence.NoResultException e) {
            return null; // Si no se encuentra ningún resultado, retornamos null
        } finally {
            em.close();
        }
    }

}
