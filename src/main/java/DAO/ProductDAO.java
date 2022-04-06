package DAO;

import JPAUtils.Jpautil;
import entity.Category;
import entity.Product;
import entity.User;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import java.util.List;

public class ProductDAO {
    private EntityManager em;

    public ProductDAO() {
        this.em = Jpautil.getEntityManager();
    }

    public Product create(Product entity) throws Exception {
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

    public Product update(Product entity) throws Exception {
        try {
            this.em.getTransaction().begin();
            this.em.merge(entity);
            this.em.getTransaction().commit();
        } catch (Exception e) {
            this.em.getTransaction().rollback();
            e.printStackTrace();
            throw e;
        }
        return entity;
    }

    public List<Product> all(){
        String jpql="SELECT obj from Product obj where obj.status=true";
        TypedQuery<Product> query =this.em.createQuery(jpql,Product.class);
        List<Product> list=query.getResultList();
        return list;
    }
    public Product findByID(int id){
        Product entity=this.em.find(Product.class,id);
        return entity;
    }
}
