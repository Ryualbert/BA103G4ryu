package com.prod.model;

import java.util.List;

public interface ProdDAO_interface {
	public void insert(ProdVO prodVO);
	public void update(ProdVO prodVO);
	public void delete(String prod_no);
	public ProdVO findByPrimaryKey(String prod_no);
	public List<ProdVO> getAll();
	public List<ProdVO> getAllToJSON();
	public List<byte[]> getImage(String prod_no);
}
