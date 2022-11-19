class ArticleModel {
  List<Data>? data;

  ArticleModel({this.data});

  ArticleModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  Attributes? attributes;

  Data({this.id, this.attributes});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attributes = json['attributes'] != null
        ? new Attributes.fromJson(json['attributes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.attributes != null) {
      data['attributes'] = this.attributes!.toJson();
    }
    return data;
  }
}

class Attributes {
  String? title;
  String? slug;
  bool? status;
  String? content;
  String? createdAt;
  String? updatedAt;
  String? publishedAt;
  Thumbnail? thumbnail;

  Attributes(
      {this.title,
        this.slug,
        this.status,
        this.content,
        this.createdAt,
        this.updatedAt,
        this.publishedAt,
        this.thumbnail});

  Attributes.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    slug = json['slug'];
    status = json['status'];
    content = json['content'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    publishedAt = json['publishedAt'];
    thumbnail = json['thumbnail'] != null
        ? new Thumbnail.fromJson(json['thumbnail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['status'] = this.status;
    data['content'] = this.content;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['publishedAt'] = this.publishedAt;
    if (this.thumbnail != null) {
      data['thumbnail'] = this.thumbnail!.toJson();
    }
    return data;
  }
}

class Thumbnail {
  Thumbnaildata? thumbnaildata;

  Thumbnail({this.thumbnaildata});

  Thumbnail.fromJson(Map<String, dynamic> json) {
    thumbnaildata = json['data'] != null
        ? new Thumbnaildata.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.thumbnaildata != null) {
      data['data'] = this.thumbnaildata!.toJson();
    }
    return data;
  }
}

class Thumbnaildata {
  int? id;
  ThumbnailAttributes? thumbnailattributes;

  Thumbnaildata({this.id, this.thumbnailattributes});

  Thumbnaildata.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    thumbnailattributes = json['attributes'] != null
        ? new ThumbnailAttributes.fromJson(json['attributes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.thumbnailattributes != null) {
      data['attributes'] = this.thumbnailattributes!.toJson();
    }
    return data;
  }
}

class ThumbnailAttributes {
  String? name;
  String? url;

  ThumbnailAttributes({this.name, this.url});

  ThumbnailAttributes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}
