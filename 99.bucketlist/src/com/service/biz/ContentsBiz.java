package com.service.biz;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.service.frame.Biz;
import com.service.frame.Dao;
@Service("contentsbiz")
public class ContentsBiz implements Biz {

	@Resource(name="contentsdao")
	Dao dao;
	
	@Override
	public void register(Object obj) throws Exception {
		
		dao.insert(obj);
	}

	@Override
	public void modify(Object obj) throws Exception {
		
		dao.update(obj);
	}

	@Override
	public void remove(Object obj) throws Exception {
		dao.delete(obj);
	}

	@Override
	public Object get(Object obj) throws Exception {
		
		return dao.select(obj);
	}

	@Override
	public ArrayList<Object> get() throws Exception {
		
		return dao.select();
	}

	@Override
	public ArrayList<Object> search(Object obj) throws Exception {
		return dao.search(obj);
	}

	@Override
	public ArrayList<Object> search(int start, int end) throws Exception {
		return dao.search(start, end);
	}

	@Override
	public void com(Object obj) throws Exception {
		dao.complete(obj);
		
	}

}
