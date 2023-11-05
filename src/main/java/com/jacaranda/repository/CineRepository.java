package com.jacaranda.repository;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.SelectionQuery;

import com.jacaranda.model.Cine;
import com.jacaranda.util.BdUtil;



public class CineRepository {
	
	public static <T> T find(Class<T> t, String c) throws Exception {
		Session session;
		T result = null;
		
		try {
			session = BdUtil.getSessionFactory().openSession();
		}catch (Exception e) {
			throw new Exception("Error en la base de datos");
		}
		
		try {
			result = session.find(t, c);
		}catch (Exception e) {
			throw new Exception("Datos no encontrados");
		}
		
		return result;
	}
	
	public static <T> List<T> findAll(Class<T> t) throws Exception{
		Session session;
		List<T> result = null;
		
		try {
			session = BdUtil.getSessionFactory().openSession();
		}catch (Exception e) {
			throw new Exception("Error en la base de datos");
		}
		
		try {
			result = (List<T>) session.createSelectionQuery("From "+t.getName()).getResultList();
		}catch (Exception e) {
			throw new Exception("Datos no encontrados");
		}
		
		return result;
	}
	
	public static <T> T add(T t) throws Exception {
		Session session;
		Transaction transaction = null;
		T result = null;
		
		try {
			session = BdUtil.getSessionFactory().openSession();
		}catch (Exception e) {
			throw new Exception("Error en la base de datos");
		}
		
		transaction = session.beginTransaction();
		
		try {
			session.persist(t);
			transaction.commit();
		}catch (Exception e) {
			transaction.rollback();
			throw new Exception("Error al añadir");
		}
		
		session.close();
		return result;
	}
	
	public static <T> T edit(T t) throws Exception {
		Session session;
		Transaction transaction = null;
		T result = null;
		
		try {
			session = BdUtil.getSessionFactory().openSession();
		}catch (Exception e) {
			throw new Exception("Error en la base de datos");
		}
		
		transaction = (Transaction) session.beginTransaction();
		
		try {
			session.merge(t);
			transaction.commit();
		}catch (Exception e) {
			transaction.rollback();
			throw new Exception("Error en la base de datos");
		}
		
		session.close();
		return result;
	}
	
	public static <T> T delete(T t) throws Exception {
		Session session;
		Transaction transaction=null;
		T result=null;
		
		try {
			session = BdUtil.getSessionFactory().openSession();
		}catch (Exception e) {
			throw new Exception("Error en la base de datos");
		}
		
		transaction = (Transaction) session.beginTransaction();
		
		try {
			session.remove(t);
			transaction.commit();
		}catch (Exception e) {
			transaction.rollback();
			throw new Exception("Error en la base de datoos");
		}
		
		session.close();
		return result;
	}
	
}
