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
import logica.Detenido;
import persistencia.exceptions.NonexistentEntityException;

/**
 *
 * @author jonii
 */
public class DetenidoJpaController implements Serializable {

    public DetenidoJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    DetenidoJpaController() {
         emf=Persistence.createEntityManagerFactory("RegitroDetenidosPU");
    }

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Detenido detenido) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(detenido);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Detenido detenido) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            detenido = em.merge(detenido);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                int id = detenido.getId();
                if (findDetenido(id) == null) {
                    throw new NonexistentEntityException("The detenido with id " + id + " no longer exists.");
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
            Detenido detenido;
            try {
                detenido = em.getReference(Detenido.class, id);
                detenido.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The detenido with id " + id + " no longer exists.", enfe);
            }
            em.remove(detenido);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Detenido> findDetenidoEntities() {
        return findDetenidoEntities(true, -1, -1);
    }

    public List<Detenido> findDetenidoEntities(int maxResults, int firstResult) {
        return findDetenidoEntities(false, maxResults, firstResult);
    }

    private List<Detenido> findDetenidoEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Detenido.class));
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

    public Detenido findDetenido(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Detenido.class, id);
        } finally {
            em.close();
        }
    }

    public int getDetenidoCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Detenido> rt = cq.from(Detenido.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
