package common;

import java.util.ArrayList;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class Hibernate_Dao extends HibernateDaoSupport {
	public boolean del(String uql) {
		// �õ����ݿ�����
		Session session = Hibernate_Util.getSession();
		// ��������
		Transaction tran = session.beginTransaction();
		try {
			Query query = session.createQuery(uql);
			query.executeUpdate();
			// �ύ����
			tran.commit();
			return true;
		} catch (HibernateException e) {
			// �ع�
			tran.rollback();
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} finally {
			if (session != null) {
				session.close();
			}
		}
	}

	public List sel(String hql) {
		Session session = null;
		Transaction tran = null;
		List li = null;
		try {
			// ��ȡsession
			session = Hibernate_Util.getSession();
			tran = session.beginTransaction();
			Query query = session.createQuery(hql);
			li = query.list();
			tran.commit();
		} catch (Exception e) {
			System.out.println("����");
			if (tran != null) {
				tran.rollback();
			}
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return li;
	}

	public boolean add(Object obj) {
		// �õ����ݿ�����
		Session session = Hibernate_Util.getSession();
		// ��������
		Transaction tran = session.beginTransaction();
		// ִ������
		try {
			session.save(obj);
			// �ύ����
			tran.commit();
			return true;
		} catch (HibernateException e) {
			// �ع�
			tran.rollback();
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} finally {
			if (session != null) {
				session.close();
			}
		}
	}

	public boolean del(Object obj) {
		// �õ����ݿ�����
		Session session = Hibernate_Util.getSession();
		// ��������
		Transaction tran = session.beginTransaction();

		// ִ������
		try {
			session.delete(obj);
			// �ύ����
			tran.commit();
			return true;
		} catch (HibernateException e) {
			// �ع�
			tran.rollback();
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} finally {
			if (session != null) {
				session.close();
			}
		}
	}

	public boolean upd(Object obj) {
		// �õ����ݿ�����
		Session session = Hibernate_Util.getSession();
		// ��������
		Transaction tran = session.beginTransaction();
		// ִ������
		try {
			session.update(obj);
			// �ύ����
			tran.commit();
			return true;
		} catch (HibernateException e) {
			// �ع�
			tran.rollback();
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} finally {
			if (session != null) {
				session.close();
			}
		}
	}

	public Object selbyid(String hql) {
		Object obj = null;
		Session session = Hibernate_Util.getSession();
		Transaction tran = session.beginTransaction();
		try {
			obj = session.createQuery(hql).uniqueResult();
			tran.commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			tran.rollback();
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return obj;
	}

	public Object getbyid(Class c, Integer i) {
		Object obj = null;
		Session session = Hibernate_Util.getSession();
		Transaction tran = session.beginTransaction();
		try {
			obj = session.get(c, i);
			tran.commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			tran.rollback();
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return obj;
	}

	public List pageByHQL(String hql, int currPage, int pageCount) {
		Session session = null;
		Transaction tran = null;
		List li = null;
		try {
			// ��ȡsession
			session = Hibernate_Util.getSession();
			tran = session.beginTransaction();
			Query query = session.createQuery(hql);
			query.setFirstResult((currPage - 1) * pageCount);// ���ÿ�ʼλ�� 0 5 10
			query.setMaxResults(pageCount);// ��������� 5 5 5
			li = query.list();
			tran.commit();
		} catch (Exception e) {
			System.out.println("����");
			if (tran != null) {
				tran.rollback();
			}
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return li;
	}

	// ԭ��̬SQL��ҳ
	public List pageBySQL(String sql, int currPage, int pageCount) {
		List list = new ArrayList();
		Session session = Hibernate_Util.getSession();
		Transaction tran = session.beginTransaction();
		try {
			SQLQuery query = session.createSQLQuery(sql);
			query.setFirstResult((currPage - 1) * pageCount);// Ҫ��ѯ����ʼλ�� 0 5 10
			query.setMaxResults(pageCount); // Ҫ��ѯ���������� 5 5 5

			// Hibernate��ɸѡ�ֶβ�ѯ�޷��ٷ��ض��󼯺ϣ���Ϊ���ܻ����Ӷ��������ѯ����ֶΣ���
			// ���԰ѽ��ת����Map���� (һ�����ݾ���һ��Map��һ���ֶξ���һ����ֵ��,������Ϊ�����Զ�Ӧ ��ֵΪֵ)
			// ע�⣺Map�з�װ�ļ������Ǵ�д
			// Map map = new HashMap();
			// map.put("ENO", "182");
			query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
			list = query.list();
			tran.commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			tran.rollback();
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return list;
	}

	public boolean executeSQL(String sql) {
		Session session = null;
		Transaction tran = null;
		try {
			// ��ȡsession
			session = Hibernate_Util.getSession();
			tran = session.beginTransaction();
			SQLQuery query = session.createSQLQuery(sql);
			query.executeUpdate();// ִ��SQL
			tran.commit();
			return true;
		} catch (HibernateException e) {
			if (tran != null) {
				tran.rollback();
			}
			e.printStackTrace();
			return false;
		} finally {
			if (session != null) {
				session.close();
			}
		}
	}

	public Integer GWDataCount_Dao(String sql) {
		Session session = null;
		Transaction tran = null;
		Object obj = null;
		try {
			// ��ȡsession
			session = Hibernate_Util.getSession();
			tran = session.beginTransaction();
			obj = session.createSQLQuery(sql).uniqueResult();
			tran.commit();
		} catch (HibernateException e) {
			if (tran != null) {
				tran.rollback();
			}
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return Integer.parseInt(obj + "");
	}

	// �������� select count(*) from EmpVO
	public int seltotalrow(String hql) {
		Object obj = null;
		Session session = Hibernate_Util.getSession();
		Transaction tran = session.beginTransaction();
		try {
			obj = session.createQuery(hql).uniqueResult();
			tran.commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			tran.rollback();
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return Integer.parseInt(obj + "");
	}

	public Long obejctCount(String hql) {
		Session session = null;
		Transaction tran = null;
		Long i = 0L;
		try {
			// ��ȡsession
			session = Hibernate_Util.getSession();
			tran = session.beginTransaction();
			Query query = session.createQuery(hql);
			i = (Long) query.uniqueResult();
			tran.commit();
		} catch (HibernateException e) {
			if (tran != null) {
				tran.rollback();
			}
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return i;
	}

	// ��������������������˳
	public Integer DataCount_Dao(String voName) {
		Object obj = null;
		Session session = Hibernate_Util.getSession();
		Transaction tran = session.beginTransaction();
		try {
			obj = session.createQuery("select count(*) from " + voName)
					.uniqueResult();
			tran.commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			tran.rollback();
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return Integer.parseInt(obj + "");
	}

	// �ı�״̬������������˳
	public boolean ChangeState_Dao(String voName, String state, String id) {
		Session session = null;
		Transaction tran = null;
		try {
			// ��ȡsession
			session = Hibernate_Util.getSession();
			tran = session.beginTransaction();
			SQLQuery query = session.createSQLQuery("update " + voName
					+ " set state='" + state + "' where id in(" + id + ")");
			query.executeUpdate();// ִ��SQL
			tran.commit();
			return true;
		} catch (HibernateException e) {
			if (tran != null) {
				tran.rollback();
			}
			e.printStackTrace();
			return false;
		} finally {
			if (session != null) {
				session.close();
			}
		}
	}

	// ���ӡ�����������˳
	public boolean Save_Dao(Object obj) {
		// �õ����ݿ�����
		Session session = Hibernate_Util.getSession();
		// ��������
		Transaction tran = session.beginTransaction();
		// ִ������
		try {
			session.save(obj);
			// �ύ����
			tran.commit();
			return true;
		} catch (HibernateException e) {
			// �ع�
			tran.rollback();
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} finally {
			if (session != null) {
				session.close();
			}
		}
	}

	// �޸ġ�����������˳
	public boolean Update_Dao(Object obj) {
		// �õ����ݿ�����
		Session session = Hibernate_Util.getSession();
		// ��������
		Transaction tran = session.beginTransaction();
		// ִ������
		try {
			session.update(obj);
			// �ύ����
			tran.commit();
			return true;
		} catch (HibernateException e) {
			// �ع�
			tran.rollback();
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} finally {
			if (session != null) {
				session.close();
			}
		}
	}

	// ����������ѯΨһֵ
	public Object selobjunique(String hql) {
		Object obj = null;
		// �õ�session
		Session session = Hibernate_Util.getSession();
		// ��ʼ����
		Transaction tran = session.beginTransaction();

		try {
			// ִ�в�ѯ
			obj = session.createQuery(hql).uniqueResult();
			// �ύ����list();
			tran.commit();
		} catch (HibernateException e) {
			// ������ʧ���ǻع�����return false
			e.printStackTrace();
			tran.rollback();// �ع�����
		} finally {
			// �ر�session
			session.close();

		}
		return obj;

	}

	// ���������ѯ�б�
	public List getSearchList_Dao(String hql, int currPage, int pageCount) {
		Session session = null;
		Transaction tran = null;
		List li = null;
		try {
			// ��ȡsession
			session = Hibernate_Util.getSession();
			tran = session.beginTransaction();
			Query query = session.createQuery(hql);
			query.setFirstResult((currPage - 1) * pageCount);// ���ÿ�ʼλ�� 0 5 10
			query.setMaxResults(pageCount);// ��������� 5 5 5
			li = query.list();
			tran.commit();
		} catch (Exception e) {
			System.out.println("����");
			if (tran != null) {
				tran.rollback();
			}
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return li;
	}

	// ���������������������
	public List getTableColumns_Dao(String tableName) {
		Session session = null;
		Transaction tran = null;
		List li = null;
		try {
			// ��ȡsession
			session = Hibernate_Util.getSession();
			tran = session.beginTransaction();
			Query query = session
					.createSQLQuery("select column_name from user_tab_cols  where table_name =upper('"
							+ tableName + "') order by column_id");
			li = query.list();
			tran.commit();
		} catch (Exception e) {
			System.out.println("����");
			if (tran != null) {
				tran.rollback();
			}
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return li;
	}

}