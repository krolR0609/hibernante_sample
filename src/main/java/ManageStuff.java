import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class ManageStuff {
    private static SessionFactory factory;
    public static void main(String[] args) {
        try{
            factory = new Configuration().configure().buildSessionFactory();
        }catch (Throwable ex) {
            System.err.println("Failed to create sessionFactory object." + ex);
            throw new ExceptionInInitializerError(ex);
        }
        ManageStuff ME = new ManageStuff();
        //Добавление в базу
        Integer stuff1 = ME.addStuff("Knifes", "is a tool with a cutting edge or blade, hand-held or otherwise, with most having a handle. Some types of knives are used as utensils", new Date());
        Integer stuff2 = ME.addStuff("Boots", "cool thing on foots", new Date());
        //Удаление из базы
        ME.deleteStuff(stuff1);
        //Обновление
        ME.updateStuff(stuff2, "Not cool thing");
        //Чтение 
        ME.readStuff();
    }
    public Integer addStuff(String type, String description, Date date){
        Session session = factory.openSession();
        Transaction tx = null;
        Integer stuffID = null;
        try{
            tx = session.beginTransaction();
            Stuff stuff = new Stuff(type, description, date);
            stuffID = (Integer) session.save(stuff);
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
        return stuffID;
    }
    public void readStuff(){
        Session session = factory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            List stuffs = session.createQuery("FROM Stuff").list();
            for (Iterator iterator =
                 stuffs.iterator(); iterator.hasNext();){
                Stuff stuff = (Stuff) iterator.next();
                System.out.print("Type: " + stuff.getType());
                System.out.print("  Description: " + stuff.getDescription());
                System.out.println("  Date: " + stuff.getDate());
            }
        }catch (HibernateException e){
            if(tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
    }
    public void updateStuff(Integer stuffId, String description){
        Session session = factory.openSession();
        Transaction tx = null;
        try{
            tx = session.beginTransaction();
            Stuff stuff = (Stuff)session.get(Stuff.class, stuffId);
            stuff.setDescription(description);
            session.update(stuff);
            tx.commit();
        }catch (HibernateException e) {
            if(tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
    }
    public void deleteStuff(Integer stuffId) {
        Session session = factory.openSession();
        Transaction tx = null;
        try{
            tx = session.beginTransaction();
            Stuff stuff = session.get(Stuff.class, stuffId);
            session.delete(stuff);
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
    }
}