package JPAUtils;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class Jpautil {
    public static EntityManagerFactory getFactory() {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("PH15021_HoangTrungThong_31032002");
        return factory;
    }
    public static EntityManager getEntityManager(){
        EntityManager em=Jpautil.getFactory().createEntityManager();
        return em;
    }
}
