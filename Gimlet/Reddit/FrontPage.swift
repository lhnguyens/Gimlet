//
//  FrontPage.swift
//  Gimlet
//
//  Created by Luan Nguyen on 2019-11-14.
//  Copyright © 2019 Luan Nguyen. All rights reserved.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let empty = try? newJSONDecoder().decode(Empty.self, from: jsonData)

import Foundation

// MARK: - Empty
struct Empty: Codable {
    let kind: String
    let data: DataClass

    enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case data = "data"
    }
}

// MARK: - DataClass
struct DataClass: Codable {
    let modhash: String
    let dist: Int
    let children: [Child]
    let after: String
    let before: JSONNull?

    enum CodingKeys: String, CodingKey {
        case modhash = "modhash"
        case dist = "dist"
        case children = "children"
        case after = "after"
        case before = "before"
    }
}

// MARK: - Child
struct Child: Codable {
    let kind: Kind
    let data: ChildData

    enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case data = "data"
    }
}

// MARK: - ChildData
struct ChildData: Codable {
    let approvedAtUTC: JSONNull?
    let subreddit: String
    let selftext: String
    let authorFullname: String
    let saved: Bool
    let modReasonTitle: JSONNull?
    let gilded: Int
    let clicked: Bool
    let title: String
    let linkFlairRichtext: [LinkFlairRichtext]
    let subredditNamePrefixed: String
    let hidden: Bool
    let pwls: Int
    let linkFlairCSSClass: String?
    let downs: Int
    let thumbnailHeight: Int?
    let hideScore: Bool
    let name: String
    let quarantine: Bool
    let linkFlairTextColor: FlairTextColor
    let authorFlairBackgroundColor: String?
    let subredditType: SubredditType
    let ups: Int
    let totalAwardsReceived: Int
    let mediaEmbed: MediaEmbed
    let thumbnailWidth: Int?
    let authorFlairTemplateID: String?
    let isOriginalContent: Bool
    let userReports: [JSONAny]
    let secureMedia: Media?
    let isRedditMediaDomain: Bool
    let isMeta: Bool
    let category: JSONNull?
    let secureMediaEmbed: MediaEmbed
    let linkFlairText: String?
    let canModPost: Bool
    let score: Int
    let approvedBy: JSONNull?
    let thumbnail: String
    let edited: Edited
    let authorFlairCSSClass: String?
    let stewardReports: [JSONAny]
    let authorFlairRichtext: [AuthorFlairRichtext]
    let gildings: Gildings
    let contentCategories: JSONNull?
    let isSelf: Bool
    let modNote: JSONNull?
    let created: Int
    let linkFlairType: AuthorFlairType
    let wls: Int
    let bannedBy: JSONNull?
    let authorFlairType: AuthorFlairType
    let domain: String
    let allowLiveComments: Bool
    let selftextHTML: String?
    let likes: JSONNull?
    let suggestedSort: String?
    let bannedAtUTC: JSONNull?
    let viewCount: JSONNull?
    let archived: Bool
    let noFollow: Bool
    let isCrosspostable: Bool
    let pinned: Bool
    let over18: Bool
    let allAwardings: [AllAwarding]
    let awarders: [String]
    let mediaOnly: Bool
    let canGild: Bool
    let spoiler: Bool
    let locked: Bool
    let authorFlairText: String?
    let visited: Bool
    let removedBy: JSONNull?
    let numReports: JSONNull?
    let distinguished: JSONNull?
    let subredditID: String
    let modReasonBy: JSONNull?
    let removalReason: JSONNull?
    let linkFlairBackgroundColor: LinkFlairBackgroundColor
    let id: String
    let isRobotIndexable: Bool
    let reportReasons: JSONNull?
    let author: String
    let discussionType: JSONNull?
    let numComments: Int
    let sendReplies: Bool
    let whitelistStatus: WhitelistStatus
    let contestMode: Bool
    let modReports: [JSONAny]
    let authorPatreonFlair: Bool
    let authorFlairTextColor: FlairTextColor?
    let permalink: String
    let parentWhitelistStatus: WhitelistStatus
    let stickied: Bool
    let url: String
    let subredditSubscribers: Int
    let createdUTC: Int
    let numCrossposts: Int
    let media: Media?
    let isVideo: Bool
    let postHint: PostHint?
    let preview: Preview?
    let linkFlairTemplateID: String?

    enum CodingKeys: String, CodingKey {
        case approvedAtUTC = "approved_at_utc"
        case subreddit = "subreddit"
        case selftext = "selftext"
        case authorFullname = "author_fullname"
        case saved = "saved"
        case modReasonTitle = "mod_reason_title"
        case gilded = "gilded"
        case clicked = "clicked"
        case title = "title"
        case linkFlairRichtext = "link_flair_richtext"
        case subredditNamePrefixed = "subreddit_name_prefixed"
        case hidden = "hidden"
        case pwls = "pwls"
        case linkFlairCSSClass = "link_flair_css_class"
        case downs = "downs"
        case thumbnailHeight = "thumbnail_height"
        case hideScore = "hide_score"
        case name = "name"
        case quarantine = "quarantine"
        case linkFlairTextColor = "link_flair_text_color"
        case authorFlairBackgroundColor = "author_flair_background_color"
        case subredditType = "subreddit_type"
        case ups = "ups"
        case totalAwardsReceived = "total_awards_received"
        case mediaEmbed = "media_embed"
        case thumbnailWidth = "thumbnail_width"
        case authorFlairTemplateID = "author_flair_template_id"
        case isOriginalContent = "is_original_content"
        case userReports = "user_reports"
        case secureMedia = "secure_media"
        case isRedditMediaDomain = "is_reddit_media_domain"
        case isMeta = "is_meta"
        case category = "category"
        case secureMediaEmbed = "secure_media_embed"
        case linkFlairText = "link_flair_text"
        case canModPost = "can_mod_post"
        case score = "score"
        case approvedBy = "approved_by"
        case thumbnail = "thumbnail"
        case edited = "edited"
        case authorFlairCSSClass = "author_flair_css_class"
        case stewardReports = "steward_reports"
        case authorFlairRichtext = "author_flair_richtext"
        case gildings = "gildings"
        case contentCategories = "content_categories"
        case isSelf = "is_self"
        case modNote = "mod_note"
        case created = "created"
        case linkFlairType = "link_flair_type"
        case wls = "wls"
        case bannedBy = "banned_by"
        case authorFlairType = "author_flair_type"
        case domain = "domain"
        case allowLiveComments = "allow_live_comments"
        case selftextHTML = "selftext_html"
        case likes = "likes"
        case suggestedSort = "suggested_sort"
        case bannedAtUTC = "banned_at_utc"
        case viewCount = "view_count"
        case archived = "archived"
        case noFollow = "no_follow"
        case isCrosspostable = "is_crosspostable"
        case pinned = "pinned"
        case over18 = "over_18"
        case allAwardings = "all_awardings"
        case awarders = "awarders"
        case mediaOnly = "media_only"
        case canGild = "can_gild"
        case spoiler = "spoiler"
        case locked = "locked"
        case authorFlairText = "author_flair_text"
        case visited = "visited"
        case removedBy = "removed_by"
        case numReports = "num_reports"
        case distinguished = "distinguished"
        case subredditID = "subreddit_id"
        case modReasonBy = "mod_reason_by"
        case removalReason = "removal_reason"
        case linkFlairBackgroundColor = "link_flair_background_color"
        case id = "id"
        case isRobotIndexable = "is_robot_indexable"
        case reportReasons = "report_reasons"
        case author = "author"
        case discussionType = "discussion_type"
        case numComments = "num_comments"
        case sendReplies = "send_replies"
        case whitelistStatus = "whitelist_status"
        case contestMode = "contest_mode"
        case modReports = "mod_reports"
        case authorPatreonFlair = "author_patreon_flair"
        case authorFlairTextColor = "author_flair_text_color"
        case permalink = "permalink"
        case parentWhitelistStatus = "parent_whitelist_status"
        case stickied = "stickied"
        case url = "url"
        case subredditSubscribers = "subreddit_subscribers"
        case createdUTC = "created_utc"
        case numCrossposts = "num_crossposts"
        case media = "media"
        case isVideo = "is_video"
        case postHint = "post_hint"
        case preview = "preview"
        case linkFlairTemplateID = "link_flair_template_id"
    }
}

// MARK: - AllAwarding
struct AllAwarding: Codable {
    let count: Int
    let isEnabled: Bool
    let subredditID: String?
    let allAwardingDescription: String
    let endDate: JSONNull?
    let awardSubType: AwardSubType
    let coinReward: Int
    let iconURL: String
    let daysOfPremium: Int
    let isNew: Bool
    let id: String
    let iconHeight: Int
    let resizedIcons: [ResizedIcon]
    let daysOfDripExtension: Int
    let awardType: AwardType
    let startDate: JSONNull?
    let coinPrice: Int
    let iconWidth: Int
    let subredditCoinReward: Int
    let name: String

    enum CodingKeys: String, CodingKey {
        case count = "count"
        case isEnabled = "is_enabled"
        case subredditID = "subreddit_id"
        case allAwardingDescription = "description"
        case endDate = "end_date"
        case awardSubType = "award_sub_type"
        case coinReward = "coin_reward"
        case iconURL = "icon_url"
        case daysOfPremium = "days_of_premium"
        case isNew = "is_new"
        case id = "id"
        case iconHeight = "icon_height"
        case resizedIcons = "resized_icons"
        case daysOfDripExtension = "days_of_drip_extension"
        case awardType = "award_type"
        case startDate = "start_date"
        case coinPrice = "coin_price"
        case iconWidth = "icon_width"
        case subredditCoinReward = "subreddit_coin_reward"
        case name = "name"
    }
}

enum AwardSubType: String, Codable {
    case community = "COMMUNITY"
    case global = "GLOBAL"
}

enum AwardType: String, Codable {
    case community = "community"
    case global = "global"
}

// MARK: - ResizedIcon
struct ResizedIcon: Codable {
    let url: String
    let width: Int
    let height: Int

    enum CodingKeys: String, CodingKey {
        case url = "url"
        case width = "width"
        case height = "height"
    }
}

// MARK: - AuthorFlairRichtext
struct AuthorFlairRichtext: Codable {
    let e: String
    let t: String?
    let a: String?
    let u: String?

    enum CodingKeys: String, CodingKey {
        case e = "e"
        case t = "t"
        case a = "a"
        case u = "u"
    }
}

enum FlairTextColor: String, Codable {
    case dark = "dark"
    case light = "light"
}

enum AuthorFlairType: String, Codable {
    case richtext = "richtext"
    case text = "text"
}

enum Edited: Codable {
    case bool(Bool)
    case integer(Int)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Bool.self) {
            self = .bool(x)
            return
        }
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        throw DecodingError.typeMismatch(Edited.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Edited"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .bool(let x):
            try container.encode(x)
        case .integer(let x):
            try container.encode(x)
        }
    }
}

// MARK: - Gildings
struct Gildings: Codable {
    let gid1: Int?
    let gid2: Int?
    let gid3: Int?

    enum CodingKeys: String, CodingKey {
        case gid1 = "gid_1"
        case gid2 = "gid_2"
        case gid3 = "gid_3"
    }
}

enum LinkFlairBackgroundColor: String, Codable {
    case e70012 = "#e70012"
    case empty = ""
    case the2B87F3 = "#2b87f3"
}

// MARK: - LinkFlairRichtext
struct LinkFlairRichtext: Codable {
    let e: AuthorFlairType
    let t: String

    enum CodingKeys: String, CodingKey {
        case e = "e"
        case t = "t"
    }
}

// MARK: - Media
struct Media: Codable {
    let oembed: Oembed
    let type: String

    enum CodingKeys: String, CodingKey {
        case oembed = "oembed"
        case type = "type"
    }
}

// MARK: - Oembed
struct Oembed: Codable {
    let providerURL: String
    let title: String
    let html: String
    let thumbnailWidth: Int
    let height: Int
    let width: Int
    let version: String
    let authorName: String
    let providerName: String
    let thumbnailURL: String
    let type: String
    let thumbnailHeight: Int
    let authorURL: String

    enum CodingKeys: String, CodingKey {
        case providerURL = "provider_url"
        case title = "title"
        case html = "html"
        case thumbnailWidth = "thumbnail_width"
        case height = "height"
        case width = "width"
        case version = "version"
        case authorName = "author_name"
        case providerName = "provider_name"
        case thumbnailURL = "thumbnail_url"
        case type = "type"
        case thumbnailHeight = "thumbnail_height"
        case authorURL = "author_url"
    }
}

// MARK: - MediaEmbed
struct MediaEmbed: Codable {
    let content: String?
    let width: Int?
    let scrolling: Bool?
    let height: Int?
    let mediaDomainURL: String?

    enum CodingKeys: String, CodingKey {
        case content = "content"
        case width = "width"
        case scrolling = "scrolling"
        case height = "height"
        case mediaDomainURL = "media_domain_url"
    }
}

enum WhitelistStatus: String, Codable {
    case allAds = "all_ads"
    case noAds = "no_ads"
}

enum PostHint: String, Codable {
    case image = "image"
    case link = "link"
    case postHintSelf = "self"
    case richVideo = "rich:video"
}

// MARK: - Preview
struct Preview: Codable {
    let images: [Image]
    let enabled: Bool
    let redditVideoPreview: RedditVideoPreview?

    enum CodingKeys: String, CodingKey {
        case images = "images"
        case enabled = "enabled"
        case redditVideoPreview = "reddit_video_preview"
    }
}

// MARK: - Image
struct Image: Codable {
    let source: ResizedIcon
    let resolutions: [ResizedIcon]
    let variants: Variants
    let id: String

    enum CodingKeys: String, CodingKey {
        case source = "source"
        case resolutions = "resolutions"
        case variants = "variants"
        case id = "id"
    }
}

// MARK: - Variants
struct Variants: Codable {
}

// MARK: - RedditVideoPreview
struct RedditVideoPreview: Codable {
    let fallbackURL: String
    let height: Int
    let width: Int
    let scrubberMediaURL: String
    let dashURL: String
    let duration: Int
    let hlsURL: String
    let isGIF: Bool
    let transcodingStatus: String

    enum CodingKeys: String, CodingKey {
        case fallbackURL = "fallback_url"
        case height = "height"
        case width = "width"
        case scrubberMediaURL = "scrubber_media_url"
        case dashURL = "dash_url"
        case duration = "duration"
        case hlsURL = "hls_url"
        case isGIF = "is_gif"
        case transcodingStatus = "transcoding_status"
    }
}

enum SubredditType: String, Codable {
    case subredditTypePublic = "public"
}

enum Kind: String, Codable {
    case t3 = "t3"
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
