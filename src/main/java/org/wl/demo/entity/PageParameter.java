package org.wl.demo.entity;

/**
 * @author wl
 * @date 2019/1/18 22:14
 * @description
 */
public class PageParameter {

    private Integer startNum;
    private Integer pageSize = 2;
    private Integer totalNum;
    private Integer totalPage;
    private Integer currentPage;

    public PageParameter(Integer totalNum, Integer currentPage) {
        if(null == currentPage){
            currentPage = 1;
        }
        this.totalNum = totalNum;
        this.currentPage = currentPage;

        this.startNum = (currentPage - 1) * this.pageSize;
        this.totalPage = (totalNum % this.pageSize) == 0 ? (totalNum % this.pageSize):(totalNum % this.pageSize)+1;
    }

    public Integer getStartNum() {
        return startNum;
    }

    public void setStartNum(Integer startNum) {
        this.startNum = startNum;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getTotalNum() {
        return totalNum;
    }

    public void setTotalNum(Integer totalNum) {
        this.totalNum = totalNum;
    }

    public Integer getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(Integer totalPage) {
        this.totalPage = totalPage;
    }

    public Integer getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(Integer currentPage) {
        this.currentPage = currentPage;
    }
}
