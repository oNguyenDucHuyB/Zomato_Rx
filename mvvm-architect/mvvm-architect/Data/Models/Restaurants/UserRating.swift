//
//  UserRating.swift
//  mvvm-architect
//
//  Created by Nguyen Duc Huy on 4/19/20.
//  Copyright © 2020 sun. All rights reserved.
//

struct UserRating: Codable {
    let aggregateRating: JSONAny
    let ratingText: String
    let ratingColor: String
    let ratingObj: RatingObj
    let votes: JSONAny
    var customRatingText: String
    var customRatingTextBackground: String
    var ratingToolTip: String

    enum CodingKeys: String, CodingKey {
        case aggregateRating = "aggregate_rating"
        case ratingText = "rating_text"
        case ratingColor = "rating_color"
        case ratingObj = "rating_obj"
        case votes
        case customRatingText = "custom_rating_text"
        case customRatingTextBackground = "custom_rating_text_background"
        case ratingToolTip = "rating_tool_tip"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        aggregateRating = try values.decode(JSONAny.self, forKey: .aggregateRating)
        ratingText = try values.decodeIfPresent(String.self, forKey: .ratingText) ?? ""
        ratingColor = try values.decodeIfPresent(String.self, forKey: .ratingColor) ?? ""
        ratingObj = try values.decode(RatingObj.self, forKey: .ratingObj)
        votes = try values.decode(JSONAny.self, forKey: .votes)
        customRatingText = try values.decodeIfPresent(String.self, forKey: .customRatingText) ?? ""
        customRatingTextBackground = try values.decodeIfPresent(String.self, forKey: .customRatingTextBackground) ?? ""
        ratingToolTip = try values.decodeIfPresent(String.self, forKey: .ratingToolTip) ?? ""
    }
}
