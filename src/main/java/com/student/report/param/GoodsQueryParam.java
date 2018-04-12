package com.student.report.param;

/**
 */
public class GoodsQueryParam {
    private Integer status;
    private Integer memberId;

    public Integer getMemberId() {
        return memberId;
    }

    public void setMemberId(Integer memberId) {
        this.memberId = memberId;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "GoodsQueryParam{" +
                "status=" + status +
                '}';
    }
}
