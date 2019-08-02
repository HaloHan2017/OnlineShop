package com.yc.olshop.bean;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class UserExample {
	protected String orderByClause;

	protected boolean distinct;

	protected List<Criteria> oredCriteria;

	public UserExample() {
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

		public Criteria andUidIsNull() {
			addCriterion("`uid` is null");
			return (Criteria) this;
		}

		public Criteria andUidIsNotNull() {
			addCriterion("`uid` is not null");
			return (Criteria) this;
		}

		public Criteria andUidEqualTo(Integer value) {
			addCriterion("`uid` =", value, "uid");
			return (Criteria) this;
		}

		public Criteria andUidNotEqualTo(Integer value) {
			addCriterion("`uid` <>", value, "uid");
			return (Criteria) this;
		}

		public Criteria andUidGreaterThan(Integer value) {
			addCriterion("`uid` >", value, "uid");
			return (Criteria) this;
		}

		public Criteria andUidGreaterThanOrEqualTo(Integer value) {
			addCriterion("`uid` >=", value, "uid");
			return (Criteria) this;
		}

		public Criteria andUidLessThan(Integer value) {
			addCriterion("`uid` <", value, "uid");
			return (Criteria) this;
		}

		public Criteria andUidLessThanOrEqualTo(Integer value) {
			addCriterion("`uid` <=", value, "uid");
			return (Criteria) this;
		}

		public Criteria andUidIn(List<Integer> values) {
			addCriterion("`uid` in", values, "uid");
			return (Criteria) this;
		}

		public Criteria andUidNotIn(List<Integer> values) {
			addCriterion("`uid` not in", values, "uid");
			return (Criteria) this;
		}

		public Criteria andUidBetween(Integer value1, Integer value2) {
			addCriterion("`uid` between", value1, value2, "uid");
			return (Criteria) this;
		}

		public Criteria andUidNotBetween(Integer value1, Integer value2) {
			addCriterion("`uid` not between", value1, value2, "uid");
			return (Criteria) this;
		}

		public Criteria andUsernameIsNull() {
			addCriterion("`username` is null");
			return (Criteria) this;
		}

		public Criteria andUsernameIsNotNull() {
			addCriterion("`username` is not null");
			return (Criteria) this;
		}

		public Criteria andUsernameEqualTo(String value) {
			addCriterion("`username` =", value, "username");
			return (Criteria) this;
		}

		public Criteria andUsernameNotEqualTo(String value) {
			addCriterion("`username` <>", value, "username");
			return (Criteria) this;
		}

		public Criteria andUsernameGreaterThan(String value) {
			addCriterion("`username` >", value, "username");
			return (Criteria) this;
		}

		public Criteria andUsernameGreaterThanOrEqualTo(String value) {
			addCriterion("`username` >=", value, "username");
			return (Criteria) this;
		}

		public Criteria andUsernameLessThan(String value) {
			addCriterion("`username` <", value, "username");
			return (Criteria) this;
		}

		public Criteria andUsernameLessThanOrEqualTo(String value) {
			addCriterion("`username` <=", value, "username");
			return (Criteria) this;
		}

		public Criteria andUsernameLike(String value) {
			addCriterion("`username` like", value, "username");
			return (Criteria) this;
		}

		public Criteria andUsernameNotLike(String value) {
			addCriterion("`username` not like", value, "username");
			return (Criteria) this;
		}

		public Criteria andUsernameIn(List<String> values) {
			addCriterion("`username` in", values, "username");
			return (Criteria) this;
		}

		public Criteria andUsernameNotIn(List<String> values) {
			addCriterion("`username` not in", values, "username");
			return (Criteria) this;
		}

		public Criteria andUsernameBetween(String value1, String value2) {
			addCriterion("`username` between", value1, value2, "username");
			return (Criteria) this;
		}

		public Criteria andUsernameNotBetween(String value1, String value2) {
			addCriterion("`username` not between", value1, value2, "username");
			return (Criteria) this;
		}

		public Criteria andPasswordIsNull() {
			addCriterion("`password` is null");
			return (Criteria) this;
		}

		public Criteria andPasswordIsNotNull() {
			addCriterion("`password` is not null");
			return (Criteria) this;
		}

		public Criteria andPasswordEqualTo(String value) {
			addCriterion("`password` =", value, "password");
			return (Criteria) this;
		}

		public Criteria andPasswordNotEqualTo(String value) {
			addCriterion("`password` <>", value, "password");
			return (Criteria) this;
		}

		public Criteria andPasswordGreaterThan(String value) {
			addCriterion("`password` >", value, "password");
			return (Criteria) this;
		}

		public Criteria andPasswordGreaterThanOrEqualTo(String value) {
			addCriterion("`password` >=", value, "password");
			return (Criteria) this;
		}

		public Criteria andPasswordLessThan(String value) {
			addCriterion("`password` <", value, "password");
			return (Criteria) this;
		}

		public Criteria andPasswordLessThanOrEqualTo(String value) {
			addCriterion("`password` <=", value, "password");
			return (Criteria) this;
		}

		public Criteria andPasswordLike(String value) {
			addCriterion("`password` like", value, "password");
			return (Criteria) this;
		}

		public Criteria andPasswordNotLike(String value) {
			addCriterion("`password` not like", value, "password");
			return (Criteria) this;
		}

		public Criteria andPasswordIn(List<String> values) {
			addCriterion("`password` in", values, "password");
			return (Criteria) this;
		}

		public Criteria andPasswordNotIn(List<String> values) {
			addCriterion("`password` not in", values, "password");
			return (Criteria) this;
		}

		public Criteria andPasswordBetween(String value1, String value2) {
			addCriterion("`password` between", value1, value2, "password");
			return (Criteria) this;
		}

		public Criteria andPasswordNotBetween(String value1, String value2) {
			addCriterion("`password` not between", value1, value2, "password");
			return (Criteria) this;
		}

		public Criteria andNameIsNull() {
			addCriterion("`name` is null");
			return (Criteria) this;
		}

		public Criteria andNameIsNotNull() {
			addCriterion("`name` is not null");
			return (Criteria) this;
		}

		public Criteria andNameEqualTo(String value) {
			addCriterion("`name` =", value, "name");
			return (Criteria) this;
		}

		public Criteria andNameNotEqualTo(String value) {
			addCriterion("`name` <>", value, "name");
			return (Criteria) this;
		}

		public Criteria andNameGreaterThan(String value) {
			addCriterion("`name` >", value, "name");
			return (Criteria) this;
		}

		public Criteria andNameGreaterThanOrEqualTo(String value) {
			addCriterion("`name` >=", value, "name");
			return (Criteria) this;
		}

		public Criteria andNameLessThan(String value) {
			addCriterion("`name` <", value, "name");
			return (Criteria) this;
		}

		public Criteria andNameLessThanOrEqualTo(String value) {
			addCriterion("`name` <=", value, "name");
			return (Criteria) this;
		}

		public Criteria andNameLike(String value) {
			addCriterion("`name` like", value, "name");
			return (Criteria) this;
		}

		public Criteria andNameNotLike(String value) {
			addCriterion("`name` not like", value, "name");
			return (Criteria) this;
		}

		public Criteria andNameIn(List<String> values) {
			addCriterion("`name` in", values, "name");
			return (Criteria) this;
		}

		public Criteria andNameNotIn(List<String> values) {
			addCriterion("`name` not in", values, "name");
			return (Criteria) this;
		}

		public Criteria andNameBetween(String value1, String value2) {
			addCriterion("`name` between", value1, value2, "name");
			return (Criteria) this;
		}

		public Criteria andNameNotBetween(String value1, String value2) {
			addCriterion("`name` not between", value1, value2, "name");
			return (Criteria) this;
		}

		public Criteria andSexIsNull() {
			addCriterion("`sex` is null");
			return (Criteria) this;
		}

		public Criteria andSexIsNotNull() {
			addCriterion("`sex` is not null");
			return (Criteria) this;
		}

		public Criteria andSexEqualTo(String value) {
			addCriterion("`sex` =", value, "sex");
			return (Criteria) this;
		}

		public Criteria andSexNotEqualTo(String value) {
			addCriterion("`sex` <>", value, "sex");
			return (Criteria) this;
		}

		public Criteria andSexGreaterThan(String value) {
			addCriterion("`sex` >", value, "sex");
			return (Criteria) this;
		}

		public Criteria andSexGreaterThanOrEqualTo(String value) {
			addCriterion("`sex` >=", value, "sex");
			return (Criteria) this;
		}

		public Criteria andSexLessThan(String value) {
			addCriterion("`sex` <", value, "sex");
			return (Criteria) this;
		}

		public Criteria andSexLessThanOrEqualTo(String value) {
			addCriterion("`sex` <=", value, "sex");
			return (Criteria) this;
		}

		public Criteria andSexLike(String value) {
			addCriterion("`sex` like", value, "sex");
			return (Criteria) this;
		}

		public Criteria andSexNotLike(String value) {
			addCriterion("`sex` not like", value, "sex");
			return (Criteria) this;
		}

		public Criteria andSexIn(List<String> values) {
			addCriterion("`sex` in", values, "sex");
			return (Criteria) this;
		}

		public Criteria andSexNotIn(List<String> values) {
			addCriterion("`sex` not in", values, "sex");
			return (Criteria) this;
		}

		public Criteria andSexBetween(String value1, String value2) {
			addCriterion("`sex` between", value1, value2, "sex");
			return (Criteria) this;
		}

		public Criteria andSexNotBetween(String value1, String value2) {
			addCriterion("`sex` not between", value1, value2, "sex");
			return (Criteria) this;
		}

		public Criteria andPhoneIsNull() {
			addCriterion("`phone` is null");
			return (Criteria) this;
		}

		public Criteria andPhoneIsNotNull() {
			addCriterion("`phone` is not null");
			return (Criteria) this;
		}

		public Criteria andPhoneEqualTo(String value) {
			addCriterion("`phone` =", value, "phone");
			return (Criteria) this;
		}

		public Criteria andPhoneNotEqualTo(String value) {
			addCriterion("`phone` <>", value, "phone");
			return (Criteria) this;
		}

		public Criteria andPhoneGreaterThan(String value) {
			addCriterion("`phone` >", value, "phone");
			return (Criteria) this;
		}

		public Criteria andPhoneGreaterThanOrEqualTo(String value) {
			addCriterion("`phone` >=", value, "phone");
			return (Criteria) this;
		}

		public Criteria andPhoneLessThan(String value) {
			addCriterion("`phone` <", value, "phone");
			return (Criteria) this;
		}

		public Criteria andPhoneLessThanOrEqualTo(String value) {
			addCriterion("`phone` <=", value, "phone");
			return (Criteria) this;
		}

		public Criteria andPhoneLike(String value) {
			addCriterion("`phone` like", value, "phone");
			return (Criteria) this;
		}

		public Criteria andPhoneNotLike(String value) {
			addCriterion("`phone` not like", value, "phone");
			return (Criteria) this;
		}

		public Criteria andPhoneIn(List<String> values) {
			addCriterion("`phone` in", values, "phone");
			return (Criteria) this;
		}

		public Criteria andPhoneNotIn(List<String> values) {
			addCriterion("`phone` not in", values, "phone");
			return (Criteria) this;
		}

		public Criteria andPhoneBetween(String value1, String value2) {
			addCriterion("`phone` between", value1, value2, "phone");
			return (Criteria) this;
		}

		public Criteria andPhoneNotBetween(String value1, String value2) {
			addCriterion("`phone` not between", value1, value2, "phone");
			return (Criteria) this;
		}

		public Criteria andEmailIsNull() {
			addCriterion("`email` is null");
			return (Criteria) this;
		}

		public Criteria andEmailIsNotNull() {
			addCriterion("`email` is not null");
			return (Criteria) this;
		}

		public Criteria andEmailEqualTo(String value) {
			addCriterion("`email` =", value, "email");
			return (Criteria) this;
		}

		public Criteria andEmailNotEqualTo(String value) {
			addCriterion("`email` <>", value, "email");
			return (Criteria) this;
		}

		public Criteria andEmailGreaterThan(String value) {
			addCriterion("`email` >", value, "email");
			return (Criteria) this;
		}

		public Criteria andEmailGreaterThanOrEqualTo(String value) {
			addCriterion("`email` >=", value, "email");
			return (Criteria) this;
		}

		public Criteria andEmailLessThan(String value) {
			addCriterion("`email` <", value, "email");
			return (Criteria) this;
		}

		public Criteria andEmailLessThanOrEqualTo(String value) {
			addCriterion("`email` <=", value, "email");
			return (Criteria) this;
		}

		public Criteria andEmailLike(String value) {
			addCriterion("`email` like", value, "email");
			return (Criteria) this;
		}

		public Criteria andEmailNotLike(String value) {
			addCriterion("`email` not like", value, "email");
			return (Criteria) this;
		}

		public Criteria andEmailIn(List<String> values) {
			addCriterion("`email` in", values, "email");
			return (Criteria) this;
		}

		public Criteria andEmailNotIn(List<String> values) {
			addCriterion("`email` not in", values, "email");
			return (Criteria) this;
		}

		public Criteria andEmailBetween(String value1, String value2) {
			addCriterion("`email` between", value1, value2, "email");
			return (Criteria) this;
		}

		public Criteria andEmailNotBetween(String value1, String value2) {
			addCriterion("`email` not between", value1, value2, "email");
			return (Criteria) this;
		}

		public Criteria andRegtimeIsNull() {
			addCriterion("`regtime` is null");
			return (Criteria) this;
		}

		public Criteria andRegtimeIsNotNull() {
			addCriterion("`regtime` is not null");
			return (Criteria) this;
		}

		public Criteria andRegtimeEqualTo(Date value) {
			addCriterion("`regtime` =", value, "regtime");
			return (Criteria) this;
		}

		public Criteria andRegtimeNotEqualTo(Date value) {
			addCriterion("`regtime` <>", value, "regtime");
			return (Criteria) this;
		}

		public Criteria andRegtimeGreaterThan(Date value) {
			addCriterion("`regtime` >", value, "regtime");
			return (Criteria) this;
		}

		public Criteria andRegtimeGreaterThanOrEqualTo(Date value) {
			addCriterion("`regtime` >=", value, "regtime");
			return (Criteria) this;
		}

		public Criteria andRegtimeLessThan(Date value) {
			addCriterion("`regtime` <", value, "regtime");
			return (Criteria) this;
		}

		public Criteria andRegtimeLessThanOrEqualTo(Date value) {
			addCriterion("`regtime` <=", value, "regtime");
			return (Criteria) this;
		}

		public Criteria andRegtimeIn(List<Date> values) {
			addCriterion("`regtime` in", values, "regtime");
			return (Criteria) this;
		}

		public Criteria andRegtimeNotIn(List<Date> values) {
			addCriterion("`regtime` not in", values, "regtime");
			return (Criteria) this;
		}

		public Criteria andRegtimeBetween(Date value1, Date value2) {
			addCriterion("`regtime` between", value1, value2, "regtime");
			return (Criteria) this;
		}

		public Criteria andRegtimeNotBetween(Date value1, Date value2) {
			addCriterion("`regtime` not between", value1, value2, "regtime");
			return (Criteria) this;
		}

		public Criteria andHeadIsNull() {
			addCriterion("`head` is null");
			return (Criteria) this;
		}

		public Criteria andHeadIsNotNull() {
			addCriterion("`head` is not null");
			return (Criteria) this;
		}

		public Criteria andHeadEqualTo(String value) {
			addCriterion("`head` =", value, "head");
			return (Criteria) this;
		}

		public Criteria andHeadNotEqualTo(String value) {
			addCriterion("`head` <>", value, "head");
			return (Criteria) this;
		}

		public Criteria andHeadGreaterThan(String value) {
			addCriterion("`head` >", value, "head");
			return (Criteria) this;
		}

		public Criteria andHeadGreaterThanOrEqualTo(String value) {
			addCriterion("`head` >=", value, "head");
			return (Criteria) this;
		}

		public Criteria andHeadLessThan(String value) {
			addCriterion("`head` <", value, "head");
			return (Criteria) this;
		}

		public Criteria andHeadLessThanOrEqualTo(String value) {
			addCriterion("`head` <=", value, "head");
			return (Criteria) this;
		}

		public Criteria andHeadLike(String value) {
			addCriterion("`head` like", value, "head");
			return (Criteria) this;
		}

		public Criteria andHeadNotLike(String value) {
			addCriterion("`head` not like", value, "head");
			return (Criteria) this;
		}

		public Criteria andHeadIn(List<String> values) {
			addCriterion("`head` in", values, "head");
			return (Criteria) this;
		}

		public Criteria andHeadNotIn(List<String> values) {
			addCriterion("`head` not in", values, "head");
			return (Criteria) this;
		}

		public Criteria andHeadBetween(String value1, String value2) {
			addCriterion("`head` between", value1, value2, "head");
			return (Criteria) this;
		}

		public Criteria andHeadNotBetween(String value1, String value2) {
			addCriterion("`head` not between", value1, value2, "head");
			return (Criteria) this;
		}

		public Criteria andScoresIsNull() {
			addCriterion("`scores` is null");
			return (Criteria) this;
		}

		public Criteria andScoresIsNotNull() {
			addCriterion("`scores` is not null");
			return (Criteria) this;
		}

		public Criteria andScoresEqualTo(Integer value) {
			addCriterion("`scores` =", value, "scores");
			return (Criteria) this;
		}

		public Criteria andScoresNotEqualTo(Integer value) {
			addCriterion("`scores` <>", value, "scores");
			return (Criteria) this;
		}

		public Criteria andScoresGreaterThan(Integer value) {
			addCriterion("`scores` >", value, "scores");
			return (Criteria) this;
		}

		public Criteria andScoresGreaterThanOrEqualTo(Integer value) {
			addCriterion("`scores` >=", value, "scores");
			return (Criteria) this;
		}

		public Criteria andScoresLessThan(Integer value) {
			addCriterion("`scores` <", value, "scores");
			return (Criteria) this;
		}

		public Criteria andScoresLessThanOrEqualTo(Integer value) {
			addCriterion("`scores` <=", value, "scores");
			return (Criteria) this;
		}

		public Criteria andScoresIn(List<Integer> values) {
			addCriterion("`scores` in", values, "scores");
			return (Criteria) this;
		}

		public Criteria andScoresNotIn(List<Integer> values) {
			addCriterion("`scores` not in", values, "scores");
			return (Criteria) this;
		}

		public Criteria andScoresBetween(Integer value1, Integer value2) {
			addCriterion("`scores` between", value1, value2, "scores");
			return (Criteria) this;
		}

		public Criteria andScoresNotBetween(Integer value1, Integer value2) {
			addCriterion("`scores` not between", value1, value2, "scores");
			return (Criteria) this;
		}

		public Criteria andLevelIsNull() {
			addCriterion("`level` is null");
			return (Criteria) this;
		}

		public Criteria andLevelIsNotNull() {
			addCriterion("`level` is not null");
			return (Criteria) this;
		}

		public Criteria andLevelEqualTo(String value) {
			addCriterion("`level` =", value, "level");
			return (Criteria) this;
		}

		public Criteria andLevelNotEqualTo(String value) {
			addCriterion("`level` <>", value, "level");
			return (Criteria) this;
		}

		public Criteria andLevelGreaterThan(String value) {
			addCriterion("`level` >", value, "level");
			return (Criteria) this;
		}

		public Criteria andLevelGreaterThanOrEqualTo(String value) {
			addCriterion("`level` >=", value, "level");
			return (Criteria) this;
		}

		public Criteria andLevelLessThan(String value) {
			addCriterion("`level` <", value, "level");
			return (Criteria) this;
		}

		public Criteria andLevelLessThanOrEqualTo(String value) {
			addCriterion("`level` <=", value, "level");
			return (Criteria) this;
		}

		public Criteria andLevelLike(String value) {
			addCriterion("`level` like", value, "level");
			return (Criteria) this;
		}

		public Criteria andLevelNotLike(String value) {
			addCriterion("`level` not like", value, "level");
			return (Criteria) this;
		}

		public Criteria andLevelIn(List<String> values) {
			addCriterion("`level` in", values, "level");
			return (Criteria) this;
		}

		public Criteria andLevelNotIn(List<String> values) {
			addCriterion("`level` not in", values, "level");
			return (Criteria) this;
		}

		public Criteria andLevelBetween(String value1, String value2) {
			addCriterion("`level` between", value1, value2, "level");
			return (Criteria) this;
		}

		public Criteria andLevelNotBetween(String value1, String value2) {
			addCriterion("`level` not between", value1, value2, "level");
			return (Criteria) this;
		}

		public Criteria andStateIsNull() {
			addCriterion("state is null");
			return (Criteria) this;
		}

		public Criteria andStateIsNotNull() {
			addCriterion("state is not null");
			return (Criteria) this;
		}

		public Criteria andStateEqualTo(Integer value) {
			addCriterion("state =", value, "state");
			return (Criteria) this;
		}

		public Criteria andStateNotEqualTo(Integer value) {
			addCriterion("state <>", value, "state");
			return (Criteria) this;
		}

		public Criteria andStateGreaterThan(Integer value) {
			addCriterion("state >", value, "state");
			return (Criteria) this;
		}

		public Criteria andStateGreaterThanOrEqualTo(Integer value) {
			addCriterion("state >=", value, "state");
			return (Criteria) this;
		}

		public Criteria andStateLessThan(Integer value) {
			addCriterion("state <", value, "state");
			return (Criteria) this;
		}

		public Criteria andStateLessThanOrEqualTo(Integer value) {
			addCriterion("state <=", value, "state");
			return (Criteria) this;
		}

		public Criteria andStateIn(List<Integer> values) {
			addCriterion("state in", values, "state");
			return (Criteria) this;
		}

		public Criteria andStateNotIn(List<Integer> values) {
			addCriterion("state not in", values, "state");
			return (Criteria) this;
		}

		public Criteria andStateBetween(Integer value1, Integer value2) {
			addCriterion("state between", value1, value2, "state");
			return (Criteria) this;
		}

		public Criteria andStateNotBetween(Integer value1, Integer value2) {
			addCriterion("state not between", value1, value2, "state");
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