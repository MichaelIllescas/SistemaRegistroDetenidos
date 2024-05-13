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
import logica.Nacionalidad;
import persistencia.exceptions.NonexistentEntityException;

/**
 *
 * @author jonii
 */
public class NacionalidadJpaController implements Serializable {

    public NacionalidadJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    NacionalidadJpaController() {
         emf=Persistence.createEntityManagerFactory("RegitroDetenidosPU");
    }

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Nacionalidad nacionalidad) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(nacionalidad);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Nacionalidad nacionalidad) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            nacionalidad = em.merge(nacionalidad);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                int id = nacionalidad.getId();
                if (findNacionalidad(id) == null) {
                    throw new NonexistentEntityException("The nacionalidad with id " + id + " no longer exists.");
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
            Nacionalidad nacionalidad;
            try {
                nacionalidad = em.getReference(Nacionalidad.class, id);
                nacionalidad.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The nacionalidad with id " + id + " no longer exists.", enfe);
            }
            em.remove(nacionalidad);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Nacionalidad> findNacionalidadEntities() {
        return findNacionalidadEntities(true, -1, -1);
    }

    public List<Nacionalidad> findNacionalidadEntities(int maxResults, int firstResult) {
        return findNacionalidadEntities(false, maxResults, firstResult);
    }

    private List<Nacionalidad> findNacionalidadEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Nacionalidad.class));
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

    public Nacionalidad findNacionalidad(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Nacionalidad.class, id);
        } finally {
            em.close();
        }
    }

    public int getNacionalidadCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Nacionalidad> rt = cq.from(Nacionalidad.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
