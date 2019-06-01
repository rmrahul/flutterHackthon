

class AnalyzedEntity {
  List<Entities> _entities;
  String _language;

  AnalyzedEntity({List<Entities> entities, String language}) {
    this._entities = entities;
    this._language = language;
  }

  List<Entities> get entities => _entities;
  set entities(List<Entities> entities) => _entities = entities;
  String get language => _language;
  set language(String language) => _language = language;

  AnalyzedEntity.fromJson(Map<String, dynamic> json) {
    if (json['entities'] != null) {
      _entities = new List<Entities>();
      json['entities'].forEach((v) { _entities.add(new Entities.fromJson(v)); });
    }
    _language = json['language'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._entities != null) {
      data['entities'] = this._entities.map((v) => v.toJson()).toList();
    }
    data['language'] = this._language;
    return data;
  }
}

class Entities {
  String _name;
  String _type;
  Metadata _metadata;
  double _salience;
  List<Mentions> _mentions;

  Entities({String name, String type, Metadata metadata, double salience, List<Mentions> mentions}) {
    this._name = name;
    this._type = type;
    this._metadata = metadata;
    this._salience = salience;
    this._mentions = mentions;
  }

  String get name => _name;
  set name(String name) => _name = name;
  String get type => _type;
  set type(String type) => _type = type;
  Metadata get metadata => _metadata;
  set metadata(Metadata metadata) => _metadata = metadata;
  double get salience => _salience;
  set salience(double salience) => _salience = salience;
  List<Mentions> get mentions => _mentions;
  set mentions(List<Mentions> mentions) => _mentions = mentions;

  Entities.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _type = json['type'];
    _metadata = json['metadata'] != null ? new Metadata.fromJson(json['metadata']) : null;
    _salience = double.parse(json['salience'].toString());
    if (json['mentions'] != null) {
      _mentions = new List<Mentions>();
      json['mentions'].forEach((v) { _mentions.add(new Mentions.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['type'] = this._type;
    if (this._metadata != null) {
      data['metadata'] = this._metadata.toJson();
    }
    data['salience'] = this._salience;
    if (this._mentions != null) {
      data['mentions'] = this._mentions.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Metadata {

  Metadata.fromJson(Map<String, dynamic> json) {
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}

class Mentions {
  PassedText _text;
  String _type;

  Mentions({PassedText text, String type}) {
    this._text = text;
    this._type = type;
  }

  PassedText get text => _text;
  set text(PassedText text) => _text = text;
  String get type => _type;
  set type(String type) => _type = type;

  Mentions.fromJson(Map<String, dynamic> json) {
    _text = json['text'] != null ? new PassedText.fromJson(json['text']) : null;
    _type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._text != null) {
      data['text'] = this._text.toJson();
    }
    data['type'] = this._type;
    return data;
  }
}

class PassedText {
  String _content;
  int _beginOffset;

  PassedText({String content, int beginOffset}) {
    this._content = content;
    this._beginOffset = beginOffset;
  }

  String get content => _content;
  set content(String content) => _content = content;
  int get beginOffset => _beginOffset;
  set beginOffset(int beginOffset) => _beginOffset = beginOffset;

  PassedText.fromJson(Map<String, dynamic> json) {
    _content = json['content'];
    _beginOffset = json['beginOffset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content'] = this._content;
    data['beginOffset'] = this._beginOffset;
    return data;
  }
}
