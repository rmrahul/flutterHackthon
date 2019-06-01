class QuestionList {
  List<Question> _items;
  bool _hasMore;
  int _quotaMax;
  int _quotaRemaining;

  QuestionList(
      {List<Question> items, bool hasMore, int quotaMax, int quotaRemaining}) {
    this._items = items;
    this._hasMore = hasMore;
    this._quotaMax = quotaMax;
    this._quotaRemaining = quotaRemaining;
  }

  List<Question> get items => _items;
  set items(List<Question> items) => _items = items;
  bool get hasMore => _hasMore;
  set hasMore(bool hasMore) => _hasMore = hasMore;
  int get quotaMax => _quotaMax;
  set quotaMax(int quotaMax) => _quotaMax = quotaMax;
  int get quotaRemaining => _quotaRemaining;
  set quotaRemaining(int quotaRemaining) => _quotaRemaining = quotaRemaining;

  QuestionList.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      _items = new List<Question>();
      json['items'].forEach((v) {
        _items.add(new Question.fromJson(v));
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

class Question {
  List<String> _tags;
  Owner _owner;
  bool _isAnswered;
  int _viewCount;
  int _answerCount;
  int _score;
  int _lastActivityDate;
  int _creationDate;
  int _lastEditDate;
  int _questionId;
  String _link;
  String _title;

  Question(
      {List<String> tags,
        Owner owner,
        bool isAnswered,
        int viewCount,
        int answerCount,
        int score,
        int lastActivityDate,
        int creationDate,
        int lastEditDate,
        int questionId,
        String link,
        String title}) {
    this._tags = tags;
    this._owner = owner;
    this._isAnswered = isAnswered;
    this._viewCount = viewCount;
    this._answerCount = answerCount;
    this._score = score;
    this._lastActivityDate = lastActivityDate;
    this._creationDate = creationDate;
    this._lastEditDate = lastEditDate;
    this._questionId = questionId;
    this._link = link;
    this._title = title;
  }

  List<String> get tags => _tags;
  set tags(List<String> tags) => _tags = tags;
  Owner get owner => _owner;
  set owner(Owner owner) => _owner = owner;
  bool get isAnswered => _isAnswered;
  set isAnswered(bool isAnswered) => _isAnswered = isAnswered;
  int get viewCount => _viewCount;
  set viewCount(int viewCount) => _viewCount = viewCount;
  int get answerCount => _answerCount;
  set answerCount(int answerCount) => _answerCount = answerCount;
  int get score => _score;
  set score(int score) => _score = score;
  int get lastActivityDate => _lastActivityDate;
  set lastActivityDate(int lastActivityDate) =>
      _lastActivityDate = lastActivityDate;
  int get creationDate => _creationDate;
  set creationDate(int creationDate) => _creationDate = creationDate;
  int get lastEditDate => _lastEditDate;
  set lastEditDate(int lastEditDate) => _lastEditDate = lastEditDate;
  int get questionId => _questionId;
  set questionId(int questionId) => _questionId = questionId;
  String get link => _link;
  set link(String link) => _link = link;
  String get title => _title;
  set title(String title) => _title = title;

  Question.fromJson(Map<String, dynamic> json) {
    _tags = json['tags'].cast<String>();
    _owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
    _isAnswered = json['is_answered'];
    _viewCount = json['view_count'];
    _answerCount = json['answer_count'];
    _score = json['score'];
    _lastActivityDate = json['last_activity_date'];
    _creationDate = json['creation_date'];
    _lastEditDate = json['last_edit_date'];
    _questionId = json['question_id'];
    _link = json['link'];
    _title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tags'] = this._tags;
    if (this._owner != null) {
      data['owner'] = this._owner.toJson();
    }
    data['is_answered'] = this._isAnswered;
    data['view_count'] = this._viewCount;
    data['answer_count'] = this._answerCount;
    data['score'] = this._score;
    data['last_activity_date'] = this._lastActivityDate;
    data['creation_date'] = this._creationDate;
    data['last_edit_date'] = this._lastEditDate;
    data['question_id'] = this._questionId;
    data['link'] = this._link;
    data['title'] = this._title;
    return data;
  }
}

class Owner {
  int _reputation;
  int _userId;
  String _userType;
  String _profileImage;
  String _displayName;
  String _link;

  Owner(
      {int reputation,
        int userId,
        String userType,
        String profileImage,
        String displayName,
        String link}) {
    this._reputation = reputation;
    this._userId = userId;
    this._userType = userType;
    this._profileImage = profileImage;
    this._displayName = displayName;
    this._link = link;
  }

  int get reputation => _reputation;
  set reputation(int reputation) => _reputation = reputation;
  int get userId => _userId;
  set userId(int userId) => _userId = userId;
  String get userType => _userType;
  set userType(String userType) => _userType = userType;
  String get profileImage => _profileImage;
  set profileImage(String profileImage) => _profileImage = profileImage;
  String get displayName => _displayName;
  set displayName(String displayName) => _displayName = displayName;
  String get link => _link;
  set link(String link) => _link = link;

  Owner.fromJson(Map<String, dynamic> json) {
    _reputation = json['reputation'];
    _userId = json['user_id'];
    _userType = json['user_type'];
    _profileImage = json['profile_image'];
    _displayName = json['display_name'];
    _link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reputation'] = this._reputation;
    data['user_id'] = this._userId;
    data['user_type'] = this._userType;
    data['profile_image'] = this._profileImage;
    data['display_name'] = this._displayName;
    data['link'] = this._link;
    return data;
  }
}
