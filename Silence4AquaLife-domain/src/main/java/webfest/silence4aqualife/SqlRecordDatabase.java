package webfest.silence4aqualife;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import java.util.List;
import javax.persistence.EntityTransaction;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author vdeiv
 */
public class SqlRecordDatabase {

    private static EntityManagerFactory factory;
    private static EntityManager manager;
    private static EntityTransaction transaction;

    public SqlRecordDatabase(String name) throws DatabaseException {
        try {
            factory = Persistence.createEntityManagerFactory(name);
            manager = factory.createEntityManager();
            transaction = manager.getTransaction();
        } catch (Exception e) {
            throw new DatabaseException(e.getMessage(), e);
        }
    }

    public void closeConnection() throws DatabaseException {
        try {
            manager.close();
            factory.close();
        } catch (Exception e) {
            throw new DatabaseException(e.getMessage(), e);
        }
    }

    public void add(Record rec) throws DatabaseException {
        try {
            transaction.begin();
            manager.persist((Record) rec);
            manager.flush();
            transaction.commit();
        } catch (Exception e) {
            transaction.rollback();
            throw new DatabaseException(e.getMessage(), e);
        }
    }

    public void update(Record rec) throws DatabaseException {
        try {
            transaction.begin();
            manager.merge(rec);
            manager.flush();
            transaction.commit();
        } catch (Exception e) {
            transaction.rollback();
            throw new DatabaseException(e.getMessage(), e);
        }
    }

    public Record getRecordById(long id) {
        return manager.find(Record.class, id);
    }

    public void delete(long id) throws DatabaseException {
        try {
            transaction.begin();
            Record rec = manager.find(Record.class, id);
            manager.remove(rec);
            manager.flush();
            transaction.commit();
        } catch (Exception e) {
            transaction.rollback();
            throw new DatabaseException(e.getMessage(), e);
        }
    }

    public List<Record> read() throws DatabaseException {
        try {
            Query query = manager.createQuery("select s from Record s"); //why select s
            List<Record> recs = (List<Record>) query.getResultList();
            return recs;
        } catch (Exception e) {
            throw new DatabaseException(e.getMessage(), e);
        }
    }
}
