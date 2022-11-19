class ArticleResponse {
  Data? _data;
  Meta? _meta;

  ArticleResponse({Data? data, Meta? meta}) {
    if (data != null) {
      this._data = data;
    }
    if (meta != null) {
      this._meta = meta;
    }
  }

  Data? get data => _data;
  set data(Data? data) => _data = data;
  Meta? get meta => _meta;
  set meta(Meta? meta) => _meta = meta;

  ArticleResponse.fromJson(Map<String, dynamic> json) {
    _data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    _meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._data != null) {
      data['data'] = this._data!.toJson();
    }
    if (this._meta != null) {
      data['meta'] = this._meta!.toJson();
    }
    return data;
  }
}

class Data {
  int? _id;
  Attributes? _attributes;

  Data({int? id, Attributes? attributes}) {
    if (id != null) {
      this._id = id;
    }
    if (attributes != null) {
      this._attributes = attributes;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  Attributes? get attributes => _attributes;
  set attributes(Attributes? attributes) => _attributes = attributes;

  Data.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _attributes = json['attributes'] != null ? new Attributes.fromJson(json['attributes']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    if (this._attributes != null) {
      data['attributes'] = this._attributes!.toJson();
    }
    return data;
  }
}

class Attributes {
  String? _title;
  String? _slug;
  bool? _status;
  String? _content;
  String? _createdAt;
  String? _updatedAt;
  String? _publishedAt;

  Attributes({String? title, String? slug, bool? status, String? content, String? createdAt, String? updatedAt, String? publishedAt}) {
    if (title != null) {
      this._title = title;
    }
    if (slug != null) {
      this._slug = slug;
    }
    if (status != null) {
      this._status = status;
    }
    if (content != null) {
      this._content = content;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
    if (publishedAt != null) {
      this._publishedAt = publishedAt;
    }
  }

  String? get title => _title;
  set title(String? title) => _title = title;
  String? get slug => _slug;
  set slug(String? slug) => _slug = slug;
  bool? get status => _status;
  set status(bool? status) => _status = status;
  String? get content => _content;
  set content(String? content) => _content = content;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  String? get publishedAt => _publishedAt;
  set publishedAt(String? publishedAt) => _publishedAt = publishedAt;

  Attributes.fromJson(Map<String, dynamic> json) {
    _title = json['title'];
    _slug = json['slug'];
    _status = json['status'];
    _content = json['content'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _publishedAt = json['publishedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this._title;
    data['slug'] = this._slug;
    data['status'] = this._status;
    data['content'] = this._content;
    data['createdAt'] = this._createdAt;
    data['updatedAt'] = this._updatedAt;
    data['publishedAt'] = this._publishedAt;
    return data;
  }
}

class Meta {


  Meta() {
  }



  Meta.fromJson(Map<String, dynamic> json) {
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}
