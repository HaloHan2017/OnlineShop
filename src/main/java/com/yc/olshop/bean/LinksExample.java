package com.yc.olshop.bean;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class LinksExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public LinksExample() {
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

        public Criteria andLidIsNull() {
            addCriterion("`lid` is null");
            return (Criteria) this;
        }

        public Criteria andLidIsNotNull() {
            addCriterion("`lid` is not null");
            return (Criteria) this;
        }

        public Criteria andLidEqualTo(Integer value) {
            addCriterion("`lid` =", value, "lid");
            return (Criteria) this;
        }

        public Criteria andLidNotEqualTo(Integer value) {
            addCriterion("`lid` <>", value, "lid");
            return (Criteria) this;
        }

        public Criteria andLidGreaterThan(Integer value) {
            addCriterion("`lid` >", value, "lid");
            return (Criteria) this;
        }

        public Criteria andLidGreaterThanOrEqualTo(Integer value) {
            addCriterion("`lid` >=", value, "lid");
            return (Criteria) this;
        }

        public Criteria andLidLessThan(Integer value) {
            addCriterion("`lid` <", value, "lid");
            return (Criteria) this;
        }

        public Criteria andLidLessThanOrEqualTo(Integer value) {
            addCriterion("`lid` <=", value, "lid");
            return (Criteria) this;
        }

        public Criteria andLidIn(List<Integer> values) {
            addCriterion("`lid` in", values, "lid");
            return (Criteria) this;
        }

        public Criteria andLidNotIn(List<Integer> values) {
            addCriterion("`lid` not in", values, "lid");
            return (Criteria) this;
        }

        public Criteria andLidBetween(Integer value1, Integer value2) {
            addCriterion("`lid` between", value1, value2, "lid");
            return (Criteria) this;
        }

        public Criteria andLidNotBetween(Integer value1, Integer value2) {
            addCriterion("`lid` not between", value1, value2, "lid");
            return (Criteria) this;
        }

        public Criteria andLnameIsNull() {
            addCriterion("`lname` is null");
            return (Criteria) this;
        }

        public Criteria andLnameIsNotNull() {
            addCriterion("`lname` is not null");
            return (Criteria) this;
        }

        public Criteria andLnameEqualTo(String value) {
            addCriterion("`lname` =", value, "lname");
            return (Criteria) this;
        }

        public Criteria andLnameNotEqualTo(String value) {
            addCriterion("`lname` <>", value, "lname");
            return (Criteria) this;
        }

        public Criteria andLnameGreaterThan(String value) {
            addCriterion("`lname` >", value, "lname");
            return (Criteria) this;
        }

        public Criteria andLnameGreaterThanOrEqualTo(String value) {
            addCriterion("`lname` >=", value, "lname");
            return (Criteria) this;
        }

        public Criteria andLnameLessThan(String value) {
            addCriterion("`lname` <", value, "lname");
            return (Criteria) this;
        }

        public Criteria andLnameLessThanOrEqualTo(String value) {
            addCriterion("`lname` <=", value, "lname");
            return (Criteria) this;
        }

        public Criteria andLnameLike(String value) {
            addCriterion("`lname` like", value, "lname");
            return (Criteria) this;
        }

        public Criteria andLnameNotLike(String value) {
            addCriterion("`lname` not like", value, "lname");
            return (Criteria) this;
        }

        public Criteria andLnameIn(List<String> values) {
            addCriterion("`lname` in", values, "lname");
            return (Criteria) this;
        }

        public Criteria andLnameNotIn(List<String> values) {
            addCriterion("`lname` not in", values, "lname");
            return (Criteria) this;
        }

        public Criteria andLnameBetween(String value1, String value2) {
            addCriterion("`lname` between", value1, value2, "lname");
            return (Criteria) this;
        }

        public Criteria andLnameNotBetween(String value1, String value2) {
            addCriterion("`lname` not between", value1, value2, "lname");
            return (Criteria) this;
        }

        public Criteria andLurlIsNull() {
            addCriterion("`lurl` is null");
            return (Criteria) this;
        }

        public Criteria andLurlIsNotNull() {
            addCriterion("`lurl` is not null");
            return (Criteria) this;
        }

        public Criteria andLurlEqualTo(String value) {
            addCriterion("`lurl` =", value, "lurl");
            return (Criteria) this;
        }

        public Criteria andLurlNotEqualTo(String value) {
            addCriterion("`lurl` <>", value, "lurl");
            return (Criteria) this;
        }

        public Criteria andLurlGreaterThan(String value) {
            addCriterion("`lurl` >", value, "lurl");
            return (Criteria) this;
        }

        public Criteria andLurlGreaterThanOrEqualTo(String value) {
            addCriterion("`lurl` >=", value, "lurl");
            return (Criteria) this;
        }

        public Criteria andLurlLessThan(String value) {
            addCriterion("`lurl` <", value, "lurl");
            return (Criteria) this;
        }

        public Criteria andLurlLessThanOrEqualTo(String value) {
            addCriterion("`lurl` <=", value, "lurl");
            return (Criteria) this;
        }

        public Criteria andLurlLike(String value) {
            addCriterion("`lurl` like", value, "lurl");
            return (Criteria) this;
        }

        public Criteria andLurlNotLike(String value) {
            addCriterion("`lurl` not like", value, "lurl");
            return (Criteria) this;
        }

        public Criteria andLurlIn(List<String> values) {
            addCriterion("`lurl` in", values, "lurl");
            return (Criteria) this;
        }

        public Criteria andLurlNotIn(List<String> values) {
            addCriterion("`lurl` not in", values, "lurl");
            return (Criteria) this;
        }

        public Criteria andLurlBetween(String value1, String value2) {
            addCriterion("`lurl` between", value1, value2, "lurl");
            return (Criteria) this;
        }

        public Criteria andLurlNotBetween(String value1, String value2) {
            addCriterion("`lurl` not between", value1, value2, "lurl");
            return (Criteria) this;
        }

        public Criteria andLtimeIsNull() {
            addCriterion("`ltime` is null");
            return (Criteria) this;
        }

        public Criteria andLtimeIsNotNull() {
            addCriterion("`ltime` is not null");
            return (Criteria) this;
        }

        public Criteria andLtimeEqualTo(Date value) {
            addCriterion("`ltime` =", value, "ltime");
            return (Criteria) this;
        }

        public Criteria andLtimeNotEqualTo(Date value) {
            addCriterion("`ltime` <>", value, "ltime");
            return (Criteria) this;
        }

        public Criteria andLtimeGreaterThan(Date value) {
            addCriterion("`ltime` >", value, "ltime");
            return (Criteria) this;
        }

        public Criteria andLtimeGreaterThanOrEqualTo(Date value) {
            addCriterion("`ltime` >=", value, "ltime");
            return (Criteria) this;
        }

        public Criteria andLtimeLessThan(Date value) {
            addCriterion("`ltime` <", value, "ltime");
            return (Criteria) this;
        }

        public Criteria andLtimeLessThanOrEqualTo(Date value) {
            addCriterion("`ltime` <=", value, "ltime");
            return (Criteria) this;
        }

        public Criteria andLtimeIn(List<Date> values) {
            addCriterion("`ltime` in", values, "ltime");
            return (Criteria) this;
        }

        public Criteria andLtimeNotIn(List<Date> values) {
            addCriterion("`ltime` not in", values, "ltime");
            return (Criteria) this;
        }

        public Criteria andLtimeBetween(Date value1, Date value2) {
            addCriterion("`ltime` between", value1, value2, "ltime");
            return (Criteria) this;
        }

        public Criteria andLtimeNotBetween(Date value1, Date value2) {
            addCriterion("`ltime` not between", value1, value2, "ltime");
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