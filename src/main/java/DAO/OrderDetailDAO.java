package DAO;

import JPAUtils.Jpautil;
import entity.Orderdetail;

import javax.persistence.EntityManager;

public class OrderDetailDAO {
    private EntityManager em;

    public OrderDetailDAO() {
        this.em = Jpautil.getEntityManager();
    }
    public Orderdetail create(Orderdetail entity) throws Exception {
        try {
            this.em.getTransaction().begin();
            this.em.persist(entity);
            this.em.getTransaction().commit();
        } catch (Exception e) {
            this.em.getTransaction().rollback();
            e.printStackTrace();
            throw e;
        }
        return entity;
    }
}
