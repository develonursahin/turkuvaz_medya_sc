// ignore_for_file: unnecessary_question_mark, prefer_void_to_null

import 'package:haber_app/models/base_model_abstract_class.dart';

class Video extends BaseModel {
  Meta? meta;
  Data? data;

  Video({this.meta, this.data});

  Video.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Meta {
  int? statusCode;
  String? message;
  String? description;
  String? brand;

  Meta({this.statusCode, this.message, this.description, this.brand});

  Meta.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    message = json['message'];
    description = json['description'];
    brand = json['brand'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status_code'] = statusCode;
    data['message'] = message;
    data['description'] = description;
    data['brand'] = brand;
    return data;
  }
}

class Data {
  Videos? videos;

  Data({this.videos});

  Data.fromJson(Map<String, dynamic> json) {
    videos = json['videos'] != null ? Videos.fromJson(json['videos']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (videos != null) {
      data['videos'] = videos!.toJson();
    }
    return data;
  }
}

class Videos {
  List<Response>? response;
  bool? status;

  Videos({this.response, this.status});

  Videos.fromJson(Map<String, dynamic> json) {
    if (json['Response'] != null) {
      response = <Response>[];
      json['Response'].forEach((v) {
        response!.add(Response.fromJson(v));
      });
    }
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (response != null) {
      data['Response'] = response!.map((v) => v.toJson()).toList();
    }
    data['Status'] = status;
    return data;
  }
}

class Response {
  Null? broadcastKind;
  String? categoryId;
  String? categoryName;
  bool? chapterShowTag;
  String? createdDate;
  String? createdDateReal;
  String? description;
  Null? episode;
  String? external;
  bool? headlineTitleCategory;
  bool? headlineTitleMainPage;
  String? id;
  int? identityId;
  bool? isGeoBlocked;
  bool? isGeoBlockedDomestic;
  bool? isModified;
  bool? isTokenRequired;
  String? modifiedDate;
  String? nameForUrl;
  String? outputDate;
  String? primaryImage;
  Null? referenceSiteId;
  Null? season;
  bool? showWebView;
  int? sortOrderCurrent;
  String? spot;
  String? spotShort;
  String? title;
  String? titleShort;
  String? url;
  String? videoDuration;
  String? videoDurationDisplay;
  Null? videoMobileUrl;
  String? videoSmilUrl;
  List<VideoSourceInfo>? videoSourceInfo;
  Null? videoSrtFile;
  String? videoType;
  int? videoTypeId;
  String? videoUrl;
  String? webSiteId;

  Response(
      {this.broadcastKind,
      this.categoryId,
      this.categoryName,
      this.chapterShowTag,
      this.createdDate,
      this.createdDateReal,
      this.description,
      this.episode,
      this.external,
      this.headlineTitleCategory,
      this.headlineTitleMainPage,
      this.id,
      this.identityId,
      this.isGeoBlocked,
      this.isGeoBlockedDomestic,
      this.isModified,
      this.isTokenRequired,
      this.modifiedDate,
      this.nameForUrl,
      this.outputDate,
      this.primaryImage,
      this.referenceSiteId,
      this.season,
      this.showWebView,
      this.sortOrderCurrent,
      this.spot,
      this.spotShort,
      this.title,
      this.titleShort,
      this.url,
      this.videoDuration,
      this.videoDurationDisplay,
      this.videoMobileUrl,
      this.videoSmilUrl,
      this.videoSourceInfo,
      this.videoSrtFile,
      this.videoType,
      this.videoTypeId,
      this.videoUrl,
      this.webSiteId});

  Response.fromJson(Map<String, dynamic> json) {
    broadcastKind = json['BroadcastKind'];
    categoryId = json['CategoryId'];
    categoryName = json['CategoryName'];
    chapterShowTag = json['ChapterShowTag'];
    createdDate = json['CreatedDate'];
    createdDateReal = json['CreatedDateReal'];
    description = json['Description'];
    episode = json['Episode'];
    external = json['External'];
    headlineTitleCategory = json['HeadlineTitleCategory'];
    headlineTitleMainPage = json['HeadlineTitleMainPage'];
    id = json['Id'];
    identityId = json['IdentityId'];
    isGeoBlocked = json['IsGeoBlocked'];
    isGeoBlockedDomestic = json['IsGeoBlockedDomestic'];
    isModified = json['IsModified'];
    isTokenRequired = json['IsTokenRequired'];
    modifiedDate = json['ModifiedDate'];
    nameForUrl = json['NameForUrl'];
    outputDate = json['OutputDate'];
    primaryImage = json['primaryImage'];
    referenceSiteId = json['ReferenceSiteId'];
    season = json['Season'];
    showWebView = json['ShowWebView'];
    sortOrderCurrent = json['SortOrderCurrent'];
    spot = json['Spot'];
    spotShort = json['SpotShort'];
    title = json['Title'];
    titleShort = json['TitleShort'];
    url = json['Url'];
    videoDuration = json['VideoDuration'];
    videoDurationDisplay = json['VideoDurationDisplay'];
    videoMobileUrl = json['VideoMobileUrl'];
    videoSmilUrl = json['VideoSmilUrl'];
    if (json['VideoSourceInfo'] != null) {
      videoSourceInfo = <VideoSourceInfo>[];
      json['VideoSourceInfo'].forEach((v) {
        videoSourceInfo!.add(VideoSourceInfo.fromJson(v));
      });
    }
    videoSrtFile = json['VideoSrtFile'];
    videoType = json['VideoType'];
    videoTypeId = json['VideoTypeId'];
    videoUrl = json['VideoUrl'];
    webSiteId = json['WebSiteId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['BroadcastKind'] = broadcastKind;
    data['CategoryId'] = categoryId;
    data['CategoryName'] = categoryName;
    data['ChapterShowTag'] = chapterShowTag;
    data['CreatedDate'] = createdDate;
    data['CreatedDateReal'] = createdDateReal;
    data['Description'] = description;
    data['Episode'] = episode;
    data['External'] = external;
    data['HeadlineTitleCategory'] = headlineTitleCategory;
    data['HeadlineTitleMainPage'] = headlineTitleMainPage;
    data['Id'] = id;
    data['IdentityId'] = identityId;
    data['IsGeoBlocked'] = isGeoBlocked;
    data['IsGeoBlockedDomestic'] = isGeoBlockedDomestic;
    data['IsModified'] = isModified;
    data['IsTokenRequired'] = isTokenRequired;
    data['ModifiedDate'] = modifiedDate;
    data['NameForUrl'] = nameForUrl;
    data['OutputDate'] = outputDate;
    data['primaryImage'] = primaryImage;
    data['ReferenceSiteId'] = referenceSiteId;
    data['Season'] = season;
    data['ShowWebView'] = showWebView;
    data['SortOrderCurrent'] = sortOrderCurrent;
    data['Spot'] = spot;
    data['SpotShort'] = spotShort;
    data['Title'] = title;
    data['TitleShort'] = titleShort;
    data['Url'] = url;
    data['VideoDuration'] = videoDuration;
    data['VideoDurationDisplay'] = videoDurationDisplay;
    data['VideoMobileUrl'] = videoMobileUrl;
    data['VideoSmilUrl'] = videoSmilUrl;
    if (videoSourceInfo != null) {
      data['VideoSourceInfo'] =
          videoSourceInfo!.map((v) => v.toJson()).toList();
    }
    data['VideoSrtFile'] = videoSrtFile;
    data['VideoType'] = videoType;
    data['VideoTypeId'] = videoTypeId;
    data['VideoUrl'] = videoUrl;
    data['WebSiteId'] = webSiteId;
    return data;
  }
}

class VideoSourceInfo {
  String? id;
  String? primaryImage;
  String? source;
  String? type;

  VideoSourceInfo({this.id, this.primaryImage, this.source, this.type});

  VideoSourceInfo.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    primaryImage = json['primaryImage'];
    source = json['Source'];
    type = json['Type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['primaryImage'] = primaryImage;
    data['Source'] = source;
    data['Type'] = type;
    return data;
  }
}
