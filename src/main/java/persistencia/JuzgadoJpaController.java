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
import logica.Juzgado;
import persistencia.exceptions.NonexistentEntityException;

/**
 *
 * @author jonii
 */
public class JuzgadoJpaController implements Serializable {

    public JuzgadoJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    JuzgadoJpaController() {
         emf=Persistence.createEntityManagerFactory("RegitroDetenidosPU");
    }

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Juzgado juzgado) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(juzgado);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Juzgado juzgado) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            juzgado = em.merge(juzgado);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                int id = juzgado.getId();
                if (findJuzgado(id) == null) {
                    throw new NonexistentEntityException("The juzgado with id " + id + " no longer exists.");
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
            Juzgado juzgado;
            try {
                juzgado = em.getReference(Juzgado.class, id);
                juzgado.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The juzgado with id " + id + " no longer exists.", enfe);
            }
            em.remove(juzgado);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Juzgado> findJuzgadoEntities() {
        return findJuzgadoEntities(true, -1, -1);
    }

    public List<Juzgado> findJuzgadoEntities(int maxResults, int firstResult) {
        return findJuzgadoEntities(false, maxResults, firstResult);
    }

    private List<Juzgado> findJuzgadoEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Juzgado.class));
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

    public Juzgado findJuzgado(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Juzgado.class, id);
        } finally {
            em.close();
        }
    }

    public int getJuzgadoCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Juzgado> rt = cq.from(Juzgado.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
