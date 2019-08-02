package com.yc.olshop.bean;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ProductExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public ProductExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andPidIsNull() {
            addCriterion("`pid` is null");
            return (Criteria) this;
        }

        public Criteria andPidIsNotNull() {
            addCriterion("`pid` is not null");
            return (Criteria) this;
        }

        public Criteria andPidEqualTo(Integer value) {
            addCriterion("`pid` =", value, "pid");
            return (Criteria) this;
        }

        public Criteria andPidNotEqualTo(Integer value) {
            addCriterion("`pid` <>", value, "pid");
            return (Criteria) this;
        }

        public Criteria andPidGreaterThan(Integer value) {
            addCriterion("`pid` >", value, "pid");
            return (Criteria) this;
        }

        public Criteria andPidGreaterThanOrEqualTo(Integer value) {
            addCriterion("`pid` >=", value, "pid");
            return (Criteria) this;
        }

        public Criteria andPidLessThan(Integer value) {
            addCriterion("`pid` <", value, "pid");
            return (Criteria) this;
        }

        public Criteria andPidLessThanOrEqualTo(Integer value) {
            addCriterion("`pid` <=", value, "pid");
            return (Criteria) this;
        }

        public Criteria andPidIn(List<Integer> values) {
            addCriterion("`pid` in", values, "pid");
            return (Criteria) this;
        }

        public Criteria andPidNotIn(List<Integer> values) {
            addCriterion("`pid` not in", values, "pid");
            return (Criteria) this;
        }

        public Criteria andPidBetween(Integer value1, Integer value2) {
            addCriterion("`pid` between", value1, value2, "pid");
            return (Criteria) this;
        }

        public Criteria andPidNotBetween(Integer value1, Integer value2) {
            addCriterion("`pid` not between", value1, value2, "pid");
            return (Criteria) this;
        }

        public Criteria andPnameIsNull() {
            addCriterion("`pname` is null");
            return (Criteria) this;
        }

        public Criteria andPnameIsNotNull() {
            addCriterion("`pname` is not null");
            return (Criteria) this;
        }

        public Criteria andPnameEqualTo(String value) {
            addCriterion("`pname` =", value, "pname");
            return (Criteria) this;
        }

        public Criteria andPnameNotEqualTo(String value) {
            addCriterion("`pname` <>", value, "pname");
            return (Criteria) this;
        }

        public Criteria andPnameGreaterThan(String value) {
            addCriterion("`pname` >", value, "pname");
            return (Criteria) this;
        }

        public Criteria andPnameGreaterThanOrEqualTo(String value) {
            addCriterion("`pname` >=", value, "pname");
            return (Criteria) this;
        }

        public Criteria andPnameLessThan(String value) {
            addCriterion("`pname` <", value, "pname");
            return (Criteria) this;
        }

        public Criteria andPnameLessThanOrEqualTo(String value) {
            addCriterion("`pname` <=", value, "pname");
            return (Criteria) this;
        }

        public Criteria andPnameLike(String value) {
            addCriterion("`pname` like", value, "pname");
            return (Criteria) this;
        }

        public Criteria andPnameNotLike(String value) {
            addCriterion("`pname` not like", value, "pname");
            return (Criteria) this;
        }

        public Criteria andPnameIn(List<String> values) {
            addCriterion("`pname` in", values, "pname");
            return (Criteria) this;
        }

        public Criteria andPnameNotIn(List<String> values) {
            addCriterion("`pname` not in", values, "pname");
            return (Criteria) this;
        }

        public Criteria andPnameBetween(String value1, String value2) {
            addCriterion("`pname` between", value1, value2, "pname");
            return (Criteria) this;
        }

        public Criteria andPnameNotBetween(String value1, String value2) {
            addCriterion("`pname` not between", value1, value2, "pname");
            return (Criteria) this;
        }

        public Criteria andPimageIsNull() {
            addCriterion("`pimage` is null");
            return (Criteria) this;
        }

        public Criteria andPimageIsNotNull() {
            addCriterion("`pimage` is not null");
            return (Criteria) this;
        }

        public Criteria andPimageEqualTo(String value) {
            addCriterion("`pimage` =", value, "pimage");
            return (Criteria) this;
        }

        public Criteria andPimageNotEqualTo(String value) {
            addCriterion("`pimage` <>", value, "pimage");
            return (Criteria) this;
        }

        public Criteria andPimageGreaterThan(String value) {
            addCriterion("`pimage` >", value, "pimage");
            return (Criteria) this;
        }

        public Criteria andPimageGreaterThanOrEqualTo(String value) {
            addCriterion("`pimage` >=", value, "pimage");
            return (Criteria) this;
        }

        public Criteria andPimageLessThan(String value) {
            addCriterion("`pimage` <", value, "pimage");
            return (Criteria) this;
        }

        public Criteria andPimageLessThanOrEqualTo(String value) {
            addCriterion("`pimage` <=", value, "pimage");
            return (Criteria) this;
        }

        public Criteria andPimageLike(String value) {
            addCriterion("`pimage` like", value, "pimage");
            return (Criteria) this;
        }

        public Criteria andPimageNotLike(String value) {
            addCriterion("`pimage` not like", value, "pimage");
            return (Criteria) this;
        }

        public Criteria andPimageIn(List<String> values) {
            addCriterion("`pimage` in", values, "pimage");
            return (Criteria) this;
        }

        public Criteria andPimageNotIn(List<String> values) {
            addCriterion("`pimage` not in", values, "pimage");
            return (Criteria) this;
        }

        public Criteria andPimageBetween(String value1, String value2) {
            addCriterion("`pimage` between", value1, value2, "pimage");
            return (Criteria) this;
        }

        public Criteria andPimageNotBetween(String value1, String value2) {
            addCriterion("`pimage` not between", value1, value2, "pimage");
            return (Criteria) this;
        }

        public Criteria andRealPriceIsNull() {
            addCriterion("`real_price` is null");
            return (Criteria) this;
        }

        public Criteria andRealPriceIsNotNull() {
            addCriterion("`real_price` is not null");
            return (Criteria) this;
        }

        public Criteria andRealPriceEqualTo(Double value) {
            addCriterion("`real_price` =", value, "realPrice");
            return (Criteria) this;
        }

        public Criteria andRealPriceNotEqualTo(Double value) {
            addCriterion("`real_price` <>", value, "realPrice");
            return (Criteria) this;
        }

        public Criteria andRealPriceGreaterThan(Double value) {
            addCriterion("`real_price` >", value, "realPrice");
            return (Criteria) this;
        }

        public Criteria andRealPriceGreaterThanOrEqualTo(Double value) {
            addCriterion("`real_price` >=", value, "realPrice");
            return (Criteria) this;
        }

        public Criteria andRealPriceLessThan(Double value) {
            addCriterion("`real_price` <", value, "realPrice");
            return (Criteria) this;
        }

        public Criteria andRealPriceLessThanOrEqualTo(Double value) {
            addCriterion("`real_price` <=", value, "realPrice");
            return (Criteria) this;
        }

        public Criteria andRealPriceIn(List<Double> values) {
            addCriterion("`real_price` in", values, "realPrice");
            return (Criteria) this;
        }

        public Criteria andRealPriceNotIn(List<Double> values) {
            addCriterion("`real_price` not in", values, "realPrice");
            return (Criteria) this;
        }

        public Criteria andRealPriceBetween(Double value1, Double value2) {
            addCriterion("`real_price` between", value1, value2, "realPrice");
            return (Criteria) this;
        }

        public Criteria andRealPriceNotBetween(Double value1, Double value2) {
            addCriterion("`real_price` not between", value1, value2, "realPrice");
            return (Criteria) this;
        }

        public Criteria andDiscPriceIsNull() {
            addCriterion("`disc_price` is null");
            return (Criteria) this;
        }

        public Criteria andDiscPriceIsNotNull() {
            addCriterion("`disc_price` is not null");
            return (Criteria) this;
        }

        public Criteria andDiscPriceEqualTo(Double value) {
            addCriterion("`disc_price` =", value, "discPrice");
            return (Criteria) this;
        }

        public Criteria andDiscPriceNotEqualTo(Double value) {
            addCriterion("`disc_price` <>", value, "discPrice");
            return (Criteria) this;
        }

        public Criteria andDiscPriceGreaterThan(Double value) {
            addCriterion("`disc_price` >", value, "discPrice");
            return (Criteria) this;
        }

        public Criteria andDiscPriceGreaterThanOrEqualTo(Double value) {
            addCriterion("`disc_price` >=", value, "discPrice");
            return (Criteria) this;
        }

        public Criteria andDiscPriceLessThan(Double value) {
            addCriterion("`disc_price` <", value, "discPrice");
            return (Criteria) this;
        }

        public Criteria andDiscPriceLessThanOrEqualTo(Double value) {
            addCriterion("`disc_price` <=", value, "discPrice");
            return (Criteria) this;
        }

        public Criteria andDiscPriceIn(List<Double> values) {
            addCriterion("`disc_price` in", values, "discPrice");
            return (Criteria) this;
        }

        public Criteria andDiscPriceNotIn(List<Double> values) {
            addCriterion("`disc_price` not in", values, "discPrice");
            return (Criteria) this;
        }

        public Criteria andDiscPriceBetween(Double value1, Double value2) {
            addCriterion("`disc_price` between", value1, value2, "discPrice");
            return (Criteria) this;
        }

        public Criteria andDiscPriceNotBetween(Double value1, Double value2) {
            addCriterion("`disc_price` not between", value1, value2, "discPrice");
            return (Criteria) this;
        }

        public Criteria andPupdateIsNull() {
            addCriterion("`pupdate` is null");
            return (Criteria) this;
        }

        public Criteria andPupdateIsNotNull() {
            addCriterion("`pupdate` is not null");
            return (Criteria) this;
        }

        public Criteria andPupdateEqualTo(Date value) {
            addCriterion("`pupdate` =", value, "pupdate");
            return (Criteria) this;
        }

        public Criteria andPupdateNotEqualTo(Date value) {
            addCriterion("`pupdate` <>", value, "pupdate");
            return (Criteria) this;
        }

        public Criteria andPupdateGreaterThan(Date value) {
            addCriterion("`pupdate` >", value, "pupdate");
            return (Criteria) this;
        }

        public Criteria andPupdateGreaterThanOrEqualTo(Date value) {
            addCriterion("`pupdate` >=", value, "pupdate");
            return (Criteria) this;
        }

        public Criteria andPupdateLessThan(Date value) {
            addCriterion("`pupdate` <", value, "pupdate");
            return (Criteria) this;
        }

        public Criteria andPupdateLessThanOrEqualTo(Date value) {
            addCriterion("`pupdate` <=", value, "pupdate");
            return (Criteria) this;
        }

        public Criteria andPupdateIn(List<Date> values) {
            addCriterion("`pupdate` in", values, "pupdate");
            return (Criteria) this;
        }

        public Criteria andPupdateNotIn(List<Date> values) {
            addCriterion("`pupdate` not in", values, "pupdate");
            return (Criteria) this;
        }

        public Criteria andPupdateBetween(Date value1, Date value2) {
            addCriterion("`pupdate` between", value1, value2, "pupdate");
            return (Criteria) this;
        }

        public Criteria andPupdateNotBetween(Date value1, Date value2) {
            addCriterion("`pupdate` not between", value1, value2, "pupdate");
            return (Criteria) this;
        }

        public Criteria andPdowndateIsNull() {
            addCriterion("`pdowndate` is null");
            return (Criteria) this;
        }

        public Criteria andPdowndateIsNotNull() {
            addCriterion("`pdowndate` is not null");
            return (Criteria) this;
        }

        public Criteria andPdowndateEqualTo(Date value) {
            addCriterion("`pdowndate` =", value, "pdowndate");
            return (Criteria) this;
        }

        public Criteria andPdowndateNotEqualTo(Date value) {
            addCriterion("`pdowndate` <>", value, "pdowndate");
            return (Criteria) this;
        }

        public Criteria andPdowndateGreaterThan(Date value) {
            addCriterion("`pdowndate` >", value, "pdowndate");
            return (Criteria) this;
        }

        public Criteria andPdowndateGreaterThanOrEqualTo(Date value) {
            addCriterion("`pdowndate` >=", value, "pdowndate");
            return (Criteria) this;
        }

        public Criteria andPdowndateLessThan(Date value) {
            addCriterion("`pdowndate` <", value, "pdowndate");
            return (Criteria) this;
        }

        public Criteria andPdowndateLessThanOrEqualTo(Date value) {
            addCriterion("`pdowndate` <=", value, "pdowndate");
            return (Criteria) this;
        }

        public Criteria andPdowndateIn(List<Date> values) {
            addCriterion("`pdowndate` in", values, "pdowndate");
            return (Criteria) this;
        }

        public Criteria andPdowndateNotIn(List<Date> values) {
            addCriterion("`pdowndate` not in", values, "pdowndate");
            return (Criteria) this;
        }

        public Criteria andPdowndateBetween(Date value1, Date value2) {
            addCriterion("`pdowndate` between", value1, value2, "pdowndate");
            return (Criteria) this;
        }

        public Criteria andPdowndateNotBetween(Date value1, Date value2) {
            addCriterion("`pdowndate` not between", value1, value2, "pdowndate");
            return (Criteria) this;
        }

        public Criteria andPflagIsNull() {
            addCriterion("`pflag` is null");
            return (Criteria) this;
        }

        public Criteria andPflagIsNotNull() {
            addCriterion("`pflag` is not null");
            return (Criteria) this;
        }

        public Criteria andPflagEqualTo(Integer value) {
            addCriterion("`pflag` =", value, "pflag");
            return (Criteria) this;
        }

        public Criteria andPflagNotEqualTo(Integer value) {
            addCriterion("`pflag` <>", value, "pflag");
            return (Criteria) this;
        }

        public Criteria andPflagGreaterThan(Integer value) {
            addCriterion("`pflag` >", value, "pflag");
            return (Criteria) this;
        }

        public Criteria andPflagGreaterThanOrEqualTo(Integer value) {
            addCriterion("`pflag` >=", value, "pflag");
            return (Criteria) this;
        }

        public Criteria andPflagLessThan(Integer value) {
            addCriterion("`pflag` <", value, "pflag");
            return (Criteria) this;
        }

        public Criteria andPflagLessThanOrEqualTo(Integer value) {
            addCriterion("`pflag` <=", value, "pflag");
            return (Criteria) this;
        }

        public Criteria andPflagIn(List<Integer> values) {
            addCriterion("`pflag` in", values, "pflag");
            return (Criteria) this;
        }

        public Criteria andPflagNotIn(List<Integer> values) {
            addCriterion("`pflag` not in", values, "pflag");
            return (Criteria) this;
        }

        public Criteria andPflagBetween(Integer value1, Integer value2) {
            addCriterion("`pflag` between", value1, value2, "pflag");
            return (Criteria) this;
        }

        public Criteria andPflagNotBetween(Integer value1, Integer value2) {
            addCriterion("`pflag` not between", value1, value2, "pflag");
            return (Criteria) this;
        }

        public Criteria andPsalenumIsNull() {
            addCriterion("`psalenum` is null");
            return (Criteria) this;
        }

        public Criteria andPsalenumIsNotNull() {
            addCriterion("`psalenum` is not null");
            return (Criteria) this;
        }

        public Criteria andPsalenumEqualTo(Integer value) {
            addCriterion("`psalenum` =", value, "psalenum");
            return (Criteria) this;
        }

        public Criteria andPsalenumNotEqualTo(Integer value) {
            addCriterion("`psalenum` <>", value, "psalenum");
            return (Criteria) this;
        }

        public Criteria andPsalenumGreaterThan(Integer value) {
            addCriterion("`psalenum` >", value, "psalenum");
            return (Criteria) this;
        }

        public Criteria andPsalenumGreaterThanOrEqualTo(Integer value) {
            addCriterion("`psalenum` >=", value, "psalenum");
            return (Criteria) this;
        }

        public Criteria andPsalenumLessThan(Integer value) {
            addCriterion("`psalenum` <", value, "psalenum");
            return (Criteria) this;
        }

        public Criteria andPsalenumLessThanOrEqualTo(Integer value) {
            addCriterion("`psalenum` <=", value, "psalenum");
            return (Criteria) this;
        }

        public Criteria andPsalenumIn(List<Integer> values) {
            addCriterion("`psalenum` in", values, "psalenum");
            return (Criteria) this;
        }

        public Criteria andPsalenumNotIn(List<Integer> values) {
            addCriterion("`psalenum` not in", values, "psalenum");
            return (Criteria) this;
        }

        public Criteria andPsalenumBetween(Integer value1, Integer value2) {
            addCriterion("`psalenum` between", value1, value2, "psalenum");
            return (Criteria) this;
        }

        public Criteria andPsalenumNotBetween(Integer value1, Integer value2) {
            addCriterion("`psalenum` not between", value1, value2, "psalenum");
            return (Criteria) this;
        }

        public Criteria andIsHotIsNull() {
            addCriterion("`is_hot` is null");
            return (Criteria) this;
        }

        public Criteria andIsHotIsNotNull() {
            addCriterion("`is_hot` is not null");
            return (Criteria) this;
        }

        public Criteria andIsHotEqualTo(Integer value) {
            addCriterion("`is_hot` =", value, "isHot");
            return (Criteria) this;
        }

        public Criteria andIsHotNotEqualTo(Integer value) {
            addCriterion("`is_hot` <>", value, "isHot");
            return (Criteria) this;
        }

        public Criteria andIsHotGreaterThan(Integer value) {
            addCriterion("`is_hot` >", value, "isHot");
            return (Criteria) this;
        }

        public Criteria andIsHotGreaterThanOrEqualTo(Integer value) {
            addCriterion("`is_hot` >=", value, "isHot");
            return (Criteria) this;
        }

        public Criteria andIsHotLessThan(Integer value) {
            addCriterion("`is_hot` <", value, "isHot");
            return (Criteria) this;
        }

        public Criteria andIsHotLessThanOrEqualTo(Integer value) {
            addCriterion("`is_hot` <=", value, "isHot");
            return (Criteria) this;
        }

        public Criteria andIsHotIn(List<Integer> values) {
            addCriterion("`is_hot` in", values, "isHot");
            return (Criteria) this;
        }

        public Criteria andIsHotNotIn(List<Integer> values) {
            addCriterion("`is_hot` not in", values, "isHot");
            return (Criteria) this;
        }

        public Criteria andIsHotBetween(Integer value1, Integer value2) {
            addCriterion("`is_hot` between", value1, value2, "isHot");
            return (Criteria) this;
        }

        public Criteria andIsHotNotBetween(Integer value1, Integer value2) {
            addCriterion("`is_hot` not between", value1, value2, "isHot");
            return (Criteria) this;
        }

        public Criteria andCidIsNull() {
            addCriterion("`cid` is null");
            return (Criteria) this;
        }

        public Criteria andCidIsNotNull() {
            addCriterion("`cid` is not null");
            return (Criteria) this;
        }

        public Criteria andCidEqualTo(Integer value) {
            addCriterion("`cid` =", value, "cid");
            return (Criteria) this;
        }

        public Criteria andCidNotEqualTo(Integer value) {
            addCriterion("`cid` <>", value, "cid");
            return (Criteria) this;
        }

        public Criteria andCidGreaterThan(Integer value) {
            addCriterion("`cid` >", value, "cid");
            return (Criteria) this;
        }

        public Criteria andCidGreaterThanOrEqualTo(Integer value) {
            addCriterion("`cid` >=", value, "cid");
            return (Criteria) this;
        }

        public Criteria andCidLessThan(Integer value) {
            addCriterion("`cid` <", value, "cid");
            return (Criteria) this;
        }

        public Criteria andCidLessThanOrEqualTo(Integer value) {
            addCriterion("`cid` <=", value, "cid");
            return (Criteria) this;
        }

        public Criteria andCidIn(List<Integer> values) {
            addCriterion("`cid` in", values, "cid");
            return (Criteria) this;
        }

        public Criteria andCidNotIn(List<Integer> values) {
            addCriterion("`cid` not in", values, "cid");
            return (Criteria) this;
        }

        public Criteria andCidBetween(Integer value1, Integer value2) {
            addCriterion("`cid` between", value1, value2, "cid");
            return (Criteria) this;
        }

        public Criteria andCidNotBetween(Integer value1, Integer value2) {
            addCriterion("`cid` not between", value1, value2, "cid");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}