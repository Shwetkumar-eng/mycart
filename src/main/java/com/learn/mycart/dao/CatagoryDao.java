package com.learn.mycart.dao;

import com.learn.mycart.entities.Catagory;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class CatagoryDao {
private SessionFactory factory;

    public CatagoryDao(SessionFactory factory) {
        this.factory = factory;
    }

  public int saveCatagory(Catagory cat)
  {
      try {
          
      } catch (Exception e) {
      }
      Session session=this.factory.openSession();
      Transaction tx=session.beginTransaction();
      
      int catId=(int)session.save(cat);
      tx.commit();
      
      session.close();
      return catId;
  }

public List<Catagory> getCatagories()
{
Session s=this.factory.openSession();
    Query query=s.createQuery("from Catagory");
List<Catagory> list=query.list();
return list;
}

public Catagory getCatagoryById(int cid)
{
    Catagory cat=null;
    try {
        
        Session session=this.factory.openSession();
         cat=session.get(Catagory.class, cid);
        session.close();
        
    } catch (Exception e) {
   e.printStackTrace();
    }

return cat;
}
}
