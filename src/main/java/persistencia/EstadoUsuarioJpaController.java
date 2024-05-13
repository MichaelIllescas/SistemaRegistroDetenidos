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
import logica.EstadoUsuario;
import persistencia.exceptions.NonexistentEntityException;

/**
 *
 * @author jonii
 */
public class EstadoUsuarioJpaController implements Serializable {

    public EstadoUsuarioJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    EstadoUsuarioJpaController() {
         emf=Persistence.createEntityManagerFactory("RegitroDetenidosPU");
    }

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(EstadoUsuario estadoUsuario) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(estadoUsuario);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(EstadoUsuario estadoUsuario) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            estadoUsuario = em.merge(estadoUsuario);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                int id = estadoUsuario.getId();
                if (findEstadoUsuario(id) == null) {
                    throw new NonexistentEntityException("The estadoUsuario with id " + id + " no longer exists.");
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
            EstadoUsuario estadoUsuario;
            try {
                estadoUsuario = em.getReference(EstadoUsuario.class, id);
                estadoUsuario.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The estadoUsuario with id " + id + " no longer exists.", enfe);
            }
            em.remove(estadoUsuario);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<EstadoUsuario> findEstadoUsuarioEntities() {
        return findEstadoUsuarioEntities(true, -1, -1);
    }

    public List<EstadoUsuario> findEstadoUsuarioEntities(int maxResults, int firstResult) {
        return findEstadoUsuarioEntities(false, maxResults, firstResult);
    }

    private List<EstadoUsuario> findEstadoUsuarioEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(EstadoUsuario.class));
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

    public EstadoUsuario findEstadoUsuario(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(EstadoUsuario.class, id);
        } finally {
            em.close();
        }
    }

    public int getEstadoUsuarioCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<EstadoUsuario> rt = cq.from(EstadoUsuario.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
