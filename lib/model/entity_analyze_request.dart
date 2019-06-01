
class EntityAnalyzeRequest {
  Document _document;
  String _encodingType;

  EntityAnalyzeRequest({Document document, String encodingType}) {
    this._document = document;
    this._encodingType = encodingType;
  }

  Document get document => _document;
  set document(Document document) => _document = document;
  String get encodingType => _encodingType;
  set encodingType(String encodingType) => _encodingType = encodingType;

  EntityAnalyzeRequest.fromJson(Map<String, dynamic> json) {
    _document = json['document'] != null
        ? new Document.fromJson(json['document'])
        : null;
    _encodingType = json['encodingType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._document != null) {
      data['document'] = this._document.toJson();
    }
    data['encodingType'] = this._encodingType;
    return data;
  }
}

class Document {
  String _content;
  String _type;
  String _language;

  Document({String content, String type, String language}) {
    this._content = content;
    this._type = type;
    this._language = language;
  }

  String get content => _content;
  set content(String content) => _content = content;
  String get type => _type;
  set type(String type) => _type = type;
  String get language => _language;
  set language(String language) => _language = language;

  Document.fromJson(Map<String, dynamic> json) {
    _content = json['content'];
    _type = json['type'];
    _language = json['language'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content'] = this._content;
    data['type'] = this._type;
    data['language'] = this._language;
    return data;
  }
}

