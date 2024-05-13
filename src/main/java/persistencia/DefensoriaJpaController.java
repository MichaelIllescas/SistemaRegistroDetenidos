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
import logica.Defensoria;
import persistencia.exceptions.NonexistentEntityException;

/**
 *
 * @author jonii
 */
public class DefensoriaJpaController implements Serializable {

    public DefensoriaJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    DefensoriaJpaController() {
       emf=Persistence.createEntityManagerFactory("RegitroDetenidosPU");
    }

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Defensoria defensoria) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(defensoria);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Defensoria defensoria) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            defensoria = em.merge(defensoria);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                int id = defensoria.getId();
                if (findDefensoria(id) == null) {
                    throw new NonexistentEntityException("The defensoria with id " + id + " no longer exists.");
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
            Defensoria defensoria;
            try {
                defensoria = em.getReference(Defensoria.class, id);
                defensoria.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The defensoria with id " + id + " no longer exists.", enfe);
            }
            em.remove(defensoria);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Defensoria> findDefensoriaEntities() {
        return findDefensoriaEntities(true, -1, -1);
    }

    public List<Defensoria> findDefensoriaEntities(int maxResults, int firstResult) {
        return findDefensoriaEntities(false, maxResults, firstResult);
    }

    private List<Defensoria> findDefensoriaEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Defensoria.class));
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

    public Defensoria findDefensoria(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Defensoria.class, id);
        } finally {
            em.close();
        }
    }

    public int getDefensoriaCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Defensoria> rt = cq.from(Defensoria.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
