package com.yc.olshop.bean;

import java.util.ArrayList;
import java.util.List;

public class OrderitemExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public OrderitemExample() {
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

        public Criteria andOitemIdIsNull() {
            addCriterion("`oitem_id` is null");
            return (Criteria) this;
        }

        public Criteria andOitemIdIsNotNull() {
            addCriterion("`oitem_id` is not null");
            return (Criteria) this;
        }

        public Criteria andOitemIdEqualTo(Integer value) {
            addCriterion("`oitem_id` =", value, "oitemId");
            return (Criteria) this;
        }

        public Criteria andOitemIdNotEqualTo(Integer value) {
            addCriterion("`oitem_id` <>", value, "oitemId");
            return (Criteria) this;
        }

        public Criteria andOitemIdGreaterThan(Integer value) {
            addCriterion("`oitem_id` >", value, "oitemId");
            return (Criteria) this;
        }

        public Criteria andOitemIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("`oitem_id` >=", value, "oitemId");
            return (Criteria) this;
        }

        public Criteria andOitemIdLessThan(Integer value) {
            addCriterion("`oitem_id` <", value, "oitemId");
            return (Criteria) this;
        }

        public Criteria andOitemIdLessThanOrEqualTo(Integer value) {
            addCriterion("`oitem_id` <=", value, "oitemId");
            return (Criteria) this;
        }

        public Criteria andOitemIdIn(List<Integer> values) {
            addCriterion("`oitem_id` in", values, "oitemId");
            return (Criteria) this;
        }

        public Criteria andOitemIdNotIn(List<Integer> values) {
            addCriterion("`oitem_id` not in", values, "oitemId");
            return (Criteria) this;
        }

        public Criteria andOitemIdBetween(Integer value1, Integer value2) {
            addCriterion("`oitem_id` between", value1, value2, "oitemId");
            return (Criteria) this;
        }

        public Criteria andOitemIdNotBetween(Integer value1, Integer value2) {
            addCriterion("`oitem_id` not between", value1, value2, "oitemId");
            return (Criteria) this;
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

        public Criteria andPcountIsNull() {
            addCriterion("`pcount` is null");
            return (Criteria) this;
        }

        public Criteria andPcountIsNotNull() {
            addCriterion("`pcount` is not null");
            return (Criteria) this;
        }

        public Criteria andPcountEqualTo(Integer value) {
            addCriterion("`pcount` =", value, "pcount");
            return (Criteria) this;
        }

        public Criteria andPcountNotEqualTo(Integer value) {
            addCriterion("`pcount` <>", value, "pcount");
            return (Criteria) this;
        }

        public Criteria andPcountGreaterThan(Integer value) {
            addCriterion("`pcount` >", value, "pcount");
            return (Criteria) this;
        }

        public Criteria andPcountGreaterThanOrEqualTo(Integer value) {
            addCriterion("`pcount` >=", value, "pcount");
            return (Criteria) this;
        }

        public Criteria andPcountLessThan(Integer value) {
            addCriterion("`pcount` <", value, "pcount");
            return (Criteria) this;
        }

        public Criteria andPcountLessThanOrEqualTo(Integer value) {
            addCriterion("`pcount` <=", value, "pcount");
            return (Criteria) this;
        }

        public Criteria andPcountIn(List<Integer> values) {
            addCriterion("`pcount` in", values, "pcount");
            return (Criteria) this;
        }

        public Criteria andPcountNotIn(List<Integer> values) {
            addCriterion("`pcount` not in", values, "pcount");
            return (Criteria) this;
        }

        public Criteria andPcountBetween(Integer value1, Integer value2) {
            addCriterion("`pcount` between", value1, value2, "pcount");
            return (Criteria) this;
        }

        public Criteria andPcountNotBetween(Integer value1, Integer value2) {
            addCriterion("`pcount` not between", value1, value2, "pcount");
            return (Criteria) this;
        }

        public Criteria andSumMoneyIsNull() {
            addCriterion("`sum_money` is null");
            return (Criteria) this;
        }

        public Criteria andSumMoneyIsNotNull() {
            addCriterion("`sum_money` is not null");
            return (Criteria) this;
        }

        public Criteria andSumMoneyEqualTo(Double value) {
            addCriterion("`sum_money` =", value, "sumMoney");
            return (Criteria) this;
        }

        public Criteria andSumMoneyNotEqualTo(Double value) {
            addCriterion("`sum_money` <>", value, "sumMoney");
            return (Criteria) this;
        }

        public Criteria andSumMoneyGreaterThan(Double value) {
            addCriterion("`sum_money` >", value, "sumMoney");
            return (Criteria) this;
        }

        public Criteria andSumMoneyGreaterThanOrEqualTo(Double value) {
            addCriterion("`sum_money` >=", value, "sumMoney");
            return (Criteria) this;
        }

        public Criteria andSumMoneyLessThan(Double value) {
            addCriterion("`sum_money` <", value, "sumMoney");
            return (Criteria) this;
        }

        public Criteria andSumMoneyLessThanOrEqualTo(Double value) {
            addCriterion("`sum_money` <=", value, "sumMoney");
            return (Criteria) this;
        }

        public Criteria andSumMoneyIn(List<Double> values) {
            addCriterion("`sum_money` in", values, "sumMoney");
            return (Criteria) this;
        }

        public Criteria andSumMoneyNotIn(List<Double> values) {
            addCriterion("`sum_money` not in", values, "sumMoney");
            return (Criteria) this;
        }

        public Criteria andSumMoneyBetween(Double value1, Double value2) {
            addCriterion("`sum_money` between", value1, value2, "sumMoney");
            return (Criteria) this;
        }

        public Criteria andSumMoneyNotBetween(Double value1, Double value2) {
            addCriterion("`sum_money` not between", value1, value2, "sumMoney");
            return (Criteria) this;
        }

        public Criteria andOidIsNull() {
            addCriterion("`oid` is null");
            return (Criteria) this;
        }

        public Criteria andOidIsNotNull() {
            addCriterion("`oid` is not null");
            return (Criteria) this;
        }

        public Criteria andOidEqualTo(String value) {
            addCriterion("`oid` =", value, "oid");
            return (Criteria) this;
        }

        public Criteria andOidNotEqualTo(String value) {
            addCriterion("`oid` <>", value, "oid");
            return (Criteria) this;
        }

        public Criteria andOidGreaterThan(String value) {
            addCriterion("`oid` >", value, "oid");
            return (Criteria) this;
        }

        public Criteria andOidGreaterThanOrEqualTo(String value) {
            addCriterion("`oid` >=", value, "oid");
            return (Criteria) this;
        }

        public Criteria andOidLessThan(String value) {
            addCriterion("`oid` <", value, "oid");
            return (Criteria) this;
        }

        public Criteria andOidLessThanOrEqualTo(String value) {
            addCriterion("`oid` <=", value, "oid");
            return (Criteria) this;
        }

        public Criteria andOidLike(String value) {
            addCriterion("`oid` like", value, "oid");
            return (Criteria) this;
        }

        public Criteria andOidNotLike(String value) {
            addCriterion("`oid` not like", value, "oid");
            return (Criteria) this;
        }

        public Criteria andOidIn(List<String> values) {
            addCriterion("`oid` in", values, "oid");
            return (Criteria) this;
        }

        public Criteria andOidNotIn(List<String> values) {
            addCriterion("`oid` not in", values, "oid");
            return (Criteria) this;
        }

        public Criteria andOidBetween(String value1, String value2) {
            addCriterion("`oid` between", value1, value2, "oid");
            return (Criteria) this;
        }

        public Criteria andOidNotBetween(String value1, String value2) {
            addCriterion("`oid` not between", value1, value2, "oid");
            return (Criteria) this;
        }

        public Criteria andPrealPriceIsNull() {
            addCriterion("`preal_price` is null");
            return (Criteria) this;
        }

        public Criteria andPrealPriceIsNotNull() {
            addCriterion("`preal_price` is not null");
            return (Criteria) this;
        }

        public Criteria andPrealPriceEqualTo(Double value) {
            addCriterion("`preal_price` =", value, "prealPrice");
            return (Criteria) this;
        }

        public Criteria andPrealPriceNotEqualTo(Double value) {
            addCriterion("`preal_price` <>", value, "prealPrice");
            return (Criteria) this;
        }

        public Criteria andPrealPriceGreaterThan(Double value) {
            addCriterion("`preal_price` >", value, "prealPrice");
            return (Criteria) this;
        }

        public Criteria andPrealPriceGreaterThanOrEqualTo(Double value) {
            addCriterion("`preal_price` >=", value, "prealPrice");
            return (Criteria) this;
        }

        public Criteria andPrealPriceLessThan(Double value) {
            addCriterion("`preal_price` <", value, "prealPrice");
            return (Criteria) this;
        }

        public Criteria andPrealPriceLessThanOrEqualTo(Double value) {
            addCriterion("`preal_price` <=", value, "prealPrice");
            return (Criteria) this;
        }

        public Criteria andPrealPriceIn(List<Double> values) {
            addCriterion("`preal_price` in", values, "prealPrice");
            return (Criteria) this;
        }

        public Criteria andPrealPriceNotIn(List<Double> values) {
            addCriterion("`preal_price` not in", values, "prealPrice");
            return (Criteria) this;
        }

        public Criteria andPrealPriceBetween(Double value1, Double value2) {
            addCriterion("`preal_price` between", value1, value2, "prealPrice");
            return (Criteria) this;
        }

        public Criteria andPrealPriceNotBetween(Double value1, Double value2) {
            addCriterion("`preal_price` not between", value1, value2, "prealPrice");
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