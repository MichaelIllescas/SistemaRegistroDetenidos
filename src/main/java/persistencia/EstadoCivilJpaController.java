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
import logica.EstadoCivil;
import persistencia.exceptions.NonexistentEntityException;

/**
 *
 * @author jonii
 */
public class EstadoCivilJpaController implements Serializable {

    public EstadoCivilJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    EstadoCivilJpaController() {
         emf=Persistence.createEntityManagerFactory("RegitroDetenidosPU");
    }

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(EstadoCivil estadoCivil) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(estadoCivil);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(EstadoCivil estadoCivil) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            estadoCivil = em.merge(estadoCivil);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                int id = estadoCivil.getId();
                if (findEstadoCivil(id) == null) {
                    throw new NonexistentEntityException("The estadoCivil with id " + id + " no longer exists.");
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
            EstadoCivil estadoCivil;
            try {
                estadoCivil = em.getReference(EstadoCivil.class, id);
                estadoCivil.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The estadoCivil with id " + id + " no longer exists.", enfe);
            }
            em.remove(estadoCivil);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<EstadoCivil> findEstadoCivilEntities() {
        return findEstadoCivilEntities(true, -1, -1);
    }

    public List<EstadoCivil> findEstadoCivilEntities(int maxResults, int firstResult) {
        return findEstadoCivilEntities(false, maxResults, firstResult);
    }

    private List<EstadoCivil> findEstadoCivilEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(EstadoCivil.class));
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

    public EstadoCivil findEstadoCivil(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(EstadoCivil.class, id);
        } finally {
            em.close();
        }
    }

    public int getEstadoCivilCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<EstadoCivil> rt = cq.from(EstadoCivil.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
