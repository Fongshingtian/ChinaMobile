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
		// 得到数据库连接
		Session session = Hibernate_Util.getSession();
		// 开启事务
		Transaction tran = session.beginTransaction();
		try {
			Query query = session.createQuery(uql);
			query.executeUpdate();
			// 提交事务
			tran.commit();
			return true;
		} catch (HibernateException e) {
			// 回滚
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
			// 获取session
			session = Hibernate_Util.getSession();
			tran = session.beginTransaction();
			Query query = session.createQuery(hql);
			li = query.list();
			tran.commit();
		} catch (Exception e) {
			System.out.println("出错");
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
		// 得到数据库连接
		Session session = Hibernate_Util.getSession();
		// 开启事务
		Transaction tran = session.beginTransaction();
		// 执行添加
		try {
			session.save(obj);
			// 提交事务
			tran.commit();
			return true;
		} catch (HibernateException e) {
			// 回滚
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
		// 得到数据库连接
		Session session = Hibernate_Util.getSession();
		// 开启事务
		Transaction tran = session.beginTransaction();

		// 执行添加
		try {
			session.delete(obj);
			// 提交事务
			tran.commit();
			return true;
		} catch (HibernateException e) {
			// 回滚
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
		// 得到数据库连接
		Session session = Hibernate_Util.getSession();
		// 开启事务
		Transaction tran = session.beginTransaction();
		// 执行添加
		try {
			session.update(obj);
			// 提交事务
			tran.commit();
			return true;
		} catch (HibernateException e) {
			// 回滚
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
			// 获取session
			session = Hibernate_Util.getSession();
			tran = session.beginTransaction();
			Query query = session.createQuery(hql);
			query.setFirstResult((currPage - 1) * pageCount);// 设置开始位置 0 5 10
			query.setMaxResults(pageCount);// 最大结果数量 5 5 5
			li = query.list();
			tran.commit();
		} catch (Exception e) {
			System.out.println("出错");
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

	// 原生态SQL分页
	public List pageBySQL(String sql, int currPage, int pageCount) {
		List list = new ArrayList();
		Session session = Hibernate_Util.getSession();
		Transaction tran = session.beginTransaction();
		try {
			SQLQuery query = session.createSQLQuery(sql);
			query.setFirstResult((currPage - 1) * pageCount);// 要查询的起始位置 0 5 10
			query.setMaxResults(pageCount); // 要查询的数据条数 5 5 5

			// Hibernate中筛选字段查询无法再返回对象集合（因为可能会连接多个表，查询多个字段），
			// 可以把结果转换成Map集合 (一条数据就是一个Map，一个字段就是一个键值对,以列名为键，以对应 的值为值)
			// 注意：Map中封装的键名字是大写
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
			// 获取session
			session = Hibernate_Util.getSession();
			tran = session.beginTransaction();
			SQLQuery query = session.createSQLQuery(sql);
			query.executeUpdate();// 执行SQL
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
			// 获取session
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

	// 求总行数 select count(*) from EmpVO
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
			// 获取session
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

	// 求总行数————方仕顺
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

	// 改变状态————方仕顺
	public boolean ChangeState_Dao(String voName, String state, String id) {
		Session session = null;
		Transaction tran = null;
		try {
			// 获取session
			session = Hibernate_Util.getSession();
			tran = session.beginTransaction();
			SQLQuery query = session.createSQLQuery("update " + voName
					+ " set state='" + state + "' where id in(" + id + ")");
			query.executeUpdate();// 执行SQL
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

	// 添加————方仕顺
	public boolean Save_Dao(Object obj) {
		// 得到数据库连接
		Session session = Hibernate_Util.getSession();
		// 开启事务
		Transaction tran = session.beginTransaction();
		// 执行添加
		try {
			session.save(obj);
			// 提交事务
			tran.commit();
			return true;
		} catch (HibernateException e) {
			// 回滚
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

	// 修改————方仕顺
	public boolean Update_Dao(Object obj) {
		// 得到数据库连接
		Session session = Hibernate_Util.getSession();
		// 开启事务
		Transaction tran = session.beginTransaction();
		// 执行添加
		try {
			session.update(obj);
			// 提交事务
			tran.commit();
			return true;
		} catch (HibernateException e) {
			// 回滚
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

	// 根据条件查询唯一值
	public Object selobjunique(String hql) {
		Object obj = null;
		// 得到session
		Session session = Hibernate_Util.getSession();
		// 开始事务
		Transaction tran = session.beginTransaction();

		try {
			// 执行查询
			obj = session.createQuery(hql).uniqueResult();
			// 提交事务list();
			tran.commit();
		} catch (HibernateException e) {
			// 当保存失败是回滚事务并return false
			e.printStackTrace();
			tran.rollback();// 回滚事务
		} finally {
			// 关闭session
			session.close();

		}
		return obj;

	}

	// 获得搜索查询列表
	public List getSearchList_Dao(String hql, int currPage, int pageCount) {
		Session session = null;
		Transaction tran = null;
		List li = null;
		try {
			// 获取session
			session = Hibernate_Util.getSession();
			tran = session.beginTransaction();
			Query query = session.createQuery(hql);
			query.setFirstResult((currPage - 1) * pageCount);// 设置开始位置 0 5 10
			query.setMaxResults(pageCount);// 最大结果数量 5 5 5
			li = query.list();
			tran.commit();
		} catch (Exception e) {
			System.out.println("出错");
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

	// 获得所搜索表的所有列名
	public List getTableColumns_Dao(String tableName) {
		Session session = null;
		Transaction tran = null;
		List li = null;
		try {
			// 获取session
			session = Hibernate_Util.getSession();
			tran = session.beginTransaction();
			Query query = session
					.createSQLQuery("select column_name from user_tab_cols  where table_name =upper('"
							+ tableName + "') order by column_id");
			li = query.list();
			tran.commit();
		} catch (Exception e) {
			System.out.println("出错");
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
