class UserList {
  List<UserModel> _items;
  bool _hasMore;
  int _quotaMax;
  int _quotaRemaining;

  UserList(
      {List<UserModel> items, bool hasMore, int quotaMax, int quotaRemaining}) {
    this._items = items;
    this._hasMore = hasMore;
    this._quotaMax = quotaMax;
    this._quotaRemaining = quotaRemaining;
  }

  List<UserModel> get items => _items;
  set items(List<UserModel> items) => _items = items;
  bool get hasMore => _hasMore;
  set hasMore(bool hasMore) => _hasMore = hasMore;
  int get quotaMax => _quotaMax;
  set quotaMax(int quotaMax) => _quotaMax = quotaMax;
  int get quotaRemaining => _quotaRemaining;
  set quotaRemaining(int quotaRemaining) => _quotaRemaining = quotaRemaining;

  UserList.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      _items = new List<UserModel>();
      json['items'].forEach((v) {
        _items.add(new UserModel.fromJson(v));
      });
    }
    _hasMore = json['has_more'];
    _quotaMax = json['quota_max'];
    _quotaRemaining = json['quota_remaining'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._items != null) {
      data['items'] = this._items.map((v) => v.toJson()).toList();
    }
    data['has_more'] = this._hasMore;
    data['quota_max'] = this._quotaMax;
    data['quota_remaining'] = this._quotaRemaining;
    return data;
  }
}

class UserModel {
  BadgeCounts _badgeCounts;
  int _accountId;
  bool _isEmployee;
  int _lastModifiedDate;
  int _lastAccessDate;
  int _reputationChangeYear;
  int _reputationChangeQuarter;
  int _reputationChangeMonth;
  int _reputationChangeWeek;
  int _reputationChangeDay;
  int _reputation;
  int _creationDate;
  String _userType;
  int _userId;
  int _acceptRate;
  String _location;
  String _websiteUrl;
  String _link;
  String _profileImage;
  String _displayName;

  UserModel(
      {BadgeCounts badgeCounts,
        int accountId,
        bool isEmployee,
        int lastModifiedDate,
        int lastAccessDate,
        int reputationChangeYear,
        int reputationChangeQuarter,
        int reputationChangeMonth,
        int reputationChangeWeek,
        int reputationChangeDay,
        int reputation,
        int creationDate,
        String userType,
        int userId,
        int acceptRate,
        String location,
        String websiteUrl,
        String link,
        String profileImage,
        String displayName}) {
    this._badgeCounts = badgeCounts;
    this._accountId = accountId;
    this._isEmployee = isEmployee;
    this._lastModifiedDate = lastModifiedDate;
    this._lastAccessDate = lastAccessDate;
    this._reputationChangeYear = reputationChangeYear;
    this._reputationChangeQuarter = reputationChangeQuarter;
    this._reputationChangeMonth = reputationChangeMonth;
    this._reputationChangeWeek = reputationChangeWeek;
    this._reputationChangeDay = reputationChangeDay;
    this._reputation = reputation;
    this._creationDate = creationDate;
    this._userType = userType;
    this._userId = userId;
    this._acceptRate = acceptRate;
    this._location = location;
    this._websiteUrl = websiteUrl;
    this._link = link;
    this._profileImage = profileImage;
    this._displayName = displayName;
  }

  BadgeCounts get badgeCounts => _badgeCounts;
  set badgeCounts(BadgeCounts badgeCounts) => _badgeCounts = badgeCounts;
  int get accountId => _accountId;
  set accountId(int accountId) => _accountId = accountId;
  bool get isEmployee => _isEmployee;
  set isEmployee(bool isEmployee) => _isEmployee = isEmployee;
  int get lastModifiedDate => _lastModifiedDate;
  set lastModifiedDate(int lastModifiedDate) =>
      _lastModifiedDate = lastModifiedDate;
  int get lastAccessDate => _lastAccessDate;
  set lastAccessDate(int lastAccessDate) => _lastAccessDate = lastAccessDate;
  int get reputationChangeYear => _reputationChangeYear;
  set reputationChangeYear(int reputationChangeYear) =>
      _reputationChangeYear = reputationChangeYear;
  int get reputationChangeQuarter => _reputationChangeQuarter;
  set reputationChangeQuarter(int reputationChangeQuarter) =>
      _reputationChangeQuarter = reputationChangeQuarter;
  int get reputationChangeMonth => _reputationChangeMonth;
  set reputationChangeMonth(int reputationChangeMonth) =>
      _reputationChangeMonth = reputationChangeMonth;
  int get reputationChangeWeek => _reputationChangeWeek;
  set reputationChangeWeek(int reputationChangeWeek) =>
      _reputationChangeWeek = reputationChangeWeek;
  int get reputationChangeDay => _reputationChangeDay;
  set reputationChangeDay(int reputationChangeDay) =>
      _reputationChangeDay = reputationChangeDay;
  int get reputation => _reputation;
  set reputation(int reputation) => _reputation = reputation;
  int get creationDate => _creationDate;
  set creationDate(int creationDate) => _creationDate = creationDate;
  String get userType => _userType;
  set userType(String userType) => _userType = userType;
  int get userId => _userId;
  set userId(int userId) => _userId = userId;
  int get acceptRate => _acceptRate;
  set acceptRate(int acceptRate) => _acceptRate = acceptRate;
  String get location => _location;
  set location(String location) => _location = location;
  String get websiteUrl => _websiteUrl;
  set websiteUrl(String websiteUrl) => _websiteUrl = websiteUrl;
  String get link => _link;
  set link(String link) => _link = link;
  String get profileImage => _profileImage;
  set profileImage(String profileImage) => _profileImage = profileImage;
  String get displayName => _displayName;
  set displayName(String displayName) => _displayName = displayName;

  UserModel.fromJson(Map<String, dynamic> json) {
    _badgeCounts = json['badge_counts'] != null
        ? new BadgeCounts.fromJson(json['badge_counts'])
        : null;
    _accountId = json['account_id'];
    _isEmployee = json['is_employee'];
    _lastModifiedDate = json['last_modified_date'];
    _lastAccessDate = json['last_access_date'];
    _reputationChangeYear = json['reputation_change_year'];
    _reputationChangeQuarter = json['reputation_change_quarter'];
    _reputationChangeMonth = json['reputation_change_month'];
    _reputationChangeWeek = json['reputation_change_week'];
    _reputationChangeDay = json['reputation_change_day'];
    _reputation = json['reputation'];
    _creationDate = json['creation_date'];
    _userType = json['user_type'];
    _userId = json['user_id'];
    _acceptRate = json['accept_rate'];
    _location = json['location'];
    _websiteUrl = json['website_url'];
    _link = json['link'];
    _profileImage = json['profile_image'];
    _displayName = json['display_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._badgeCounts != null) {
      data['badge_counts'] = this._badgeCounts.toJson();
    }
    data['account_id'] = this._accountId;
    data['is_employee'] = this._isEmployee;
    data['last_modified_date'] = this._lastModifiedDate;
    data['last_access_date'] = this._lastAccessDate;
    data['reputation_change_year'] = this._reputationChangeYear;
    data['reputation_change_quarter'] = this._reputationChangeQuarter;
    data['reputation_change_month'] = this._reputationChangeMonth;
    data['reputation_change_week'] = this._reputationChangeWeek;
    data['reputation_change_day'] = this._reputationChangeDay;
    data['reputation'] = this._reputation;
    data['creation_date'] = this._creationDate;
    data['user_type'] = this._userType;
    data['user_id'] = this._userId;
    data['accept_rate'] = this._acceptRate;
    data['location'] = this._location;
    data['website_url'] = this._websiteUrl;
    data['link'] = this._link;
    data['profile_image'] = this._profileImage;
    data['display_name'] = this._displayName;
    return data;
  }
}

class BadgeCounts {
  int _bronze;
  int _silver;
  int _gold;

  BadgeCounts({int bronze, int silver, int gold}) {
    this._bronze = bronze;
    this._silver = silver;
    this._gold = gold;
  }

  int get bronze => _bronze;
  set bronze(int bronze) => _bronze = bronze;
  int get silver => _silver;
  set silver(int silver) => _silver = silver;
  int get gold => _gold;
  set gold(int gold) => _gold = gold;

  BadgeCounts.fromJson(Map<String, dynamic> json) {
    _bronze = json['bronze'];
    _silver = json['silver'];
    _gold = json['gold'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bronze'] = this._bronze;
    data['silver'] = this._silver;
    data['gold'] = this._gold;
    return data;
  }
}

