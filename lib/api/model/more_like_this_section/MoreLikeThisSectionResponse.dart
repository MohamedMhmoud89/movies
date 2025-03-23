import 'package:movies/api/model/more_like_this_section/MoreLikeThisSection.dart';

class MoreLikeThisSectionResponse {
  int? page;
  List<MoreLikeThisSection>? results;
  int? totalPages;
  int? totalResults;

  MoreLikeThisSectionResponse({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  MoreLikeThisSectionResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <MoreLikeThisSection>[];
      json['results'].forEach((v) {
        results!.add(new MoreLikeThisSection.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = this.totalPages;
    data['total_results'] = this.totalResults;
    return data;
  }
}
