package org.wl.demo.entity;

import java.io.Serializable;

/**
 * @author wl
 * @date 2019/1/18 22:21
 * @description
 */
public class BaseEntity implements Serializable {

    private static final long serialVersionUID = 4541239137054899059L;
    private PageParameter pageParameter;

    public PageParameter getPageParameter() {
        return pageParameter;
    }

    public void setPageParameter(PageParameter pageParameter) {
        this.pageParameter = pageParameter;
    }
}
