package com.review.model;

import java.util.List;

public interface ReviewDAO_interface {

    public void insert(ReviewVO reviewVO);
    public void update(ReviewVO reviewVO);
    public void delete(String rev_no);
    public ReviewVO findByPrimaryKey(String rev_no);
    public List<ReviewVO> getAll();
    public int countByProd(String prod_no);
}
