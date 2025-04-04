package com.epegase.systeme.dao;

import com.epegase.systeme.classe.PegEnquete;
import com.epegase.systeme.util.UtilInitHibernate;
import java.io.Serializable;
import javax.naming.NamingException;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class PegEnqueteDao implements Serializable {
   private UtilInitHibernate utilInitHibernate;

   public PegEnqueteDao(UtilInitHibernate var1) {
      this.utilInitHibernate = var1;
   }

   public PegEnquete insert(PegEnquete var1) throws HibernateException, NamingException {
      Session var2 = this.utilInitHibernate.getSystemeEPegase();
      Transaction var3 = null;

      try {
         var3 = var2.beginTransaction();
         var2.save(var1);
         var3.commit();
      } catch (HibernateException var8) {
         if (var3 != null) {
            var3.rollback();
         }

         throw var8;
      } finally {
         this.utilInitHibernate.closeSession();
      }

      return var1;
   }

   public PegEnquete modif(PegEnquete var1) throws HibernateException, NamingException {
      Session var2 = this.utilInitHibernate.getSystemeEPegase();
      Transaction var3 = null;

      try {
         var3 = var2.beginTransaction();
         var2.update(var1);
         var3.commit();
      } catch (HibernateException var8) {
         if (var3 != null) {
            var3.rollback();
         }

         throw var8;
      } finally {
         this.utilInitHibernate.closeSession();
      }

      return var1;
   }

   public PegEnquete reponse(PegEnquete var1) throws HibernateException, NamingException {
      Session var2 = this.utilInitHibernate.getSysteme();
      Transaction var3 = null;

      try {
         var3 = var2.beginTransaction();
         var2.update(var1);
         var3.commit();
      } catch (HibernateException var8) {
         if (var3 != null) {
            var3.rollback();
         }

         throw var8;
      } finally {
         this.utilInitHibernate.closeSession();
      }

      return var1;
   }

   public void delete(PegEnquete var1) throws HibernateException, NamingException {
      Session var2 = this.utilInitHibernate.getSystemeEPegase();
      Transaction var3 = null;

      try {
         var3 = var2.beginTransaction();
         var2.delete(var1);
         var3.commit();
      } catch (HibernateException var8) {
         if (var3 != null) {
            var3.rollback();
         }

         throw var8;
      } finally {
         this.utilInitHibernate.closeSession();
      }

   }
}
