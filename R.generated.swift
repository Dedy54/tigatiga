//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap { Locale(identifier: $0) } ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)

  /// Find first language and bundle for which the table exists
  fileprivate static func localeBundle(tableName: String, preferredLanguages: [String]) -> (Foundation.Locale, Foundation.Bundle)? {
    // Filter preferredLanguages to localizations, use first locale
    var languages = preferredLanguages
      .map { Locale(identifier: $0) }
      .prefix(1)
      .flatMap { locale -> [String] in
        if hostingBundle.localizations.contains(locale.identifier) {
          if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
            return [locale.identifier, language]
          } else {
            return [locale.identifier]
          }
        } else if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
          return [language]
        } else {
          return []
        }
      }

    // If there's no languages, use development language as backstop
    if languages.isEmpty {
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages = [developmentLocalization]
      }
    } else {
      // Insert Base as second item (between locale identifier and languageCode)
      languages.insert("Base", at: 1)

      // Add development language as backstop
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages.append(developmentLocalization)
      }
    }

    // Find first language for which table exists
    // Note: key might not exist in chosen language (in that case, key will be shown)
    for language in languages {
      if let lproj = hostingBundle.url(forResource: language, withExtension: "lproj"),
         let lbundle = Bundle(url: lproj)
      {
        let strings = lbundle.url(forResource: tableName, withExtension: "strings")
        let stringsdict = lbundle.url(forResource: tableName, withExtension: "stringsdict")

        if strings != nil || stringsdict != nil {
          return (Locale(identifier: language), lbundle)
        }
      }
    }

    // If table is available in main bundle, don't look for localized resources
    let strings = hostingBundle.url(forResource: tableName, withExtension: "strings", subdirectory: nil, localization: nil)
    let stringsdict = hostingBundle.url(forResource: tableName, withExtension: "stringsdict", subdirectory: nil, localization: nil)

    if strings != nil || stringsdict != nil {
      return (applicationLocale, hostingBundle)
    }

    // If table is not found for requested languages, key will be shown
    return nil
  }

  /// Load string from Info.plist file
  fileprivate static func infoPlistString(path: [String], key: String) -> String? {
    var dict = hostingBundle.infoDictionary
    for step in path {
      guard let obj = dict?[step] as? [String: Any] else { return nil }
      dict = obj
    }
    return dict?[key] as? String
  }

  static func validate() throws {
    try font.validate()
    try intern.validate()
  }

  #if os(iOS) || os(tvOS)
  /// This `R.segue` struct is generated, and contains static references to 2 view controllers.
  struct segue {
    /// This struct is generated for `SearchResultVC`, and contains static references to 1 segues.
    struct searchResultVC {
      /// Segue identifier `searchPeopleSegue`.
      static let searchPeopleSegue: Rswift.StoryboardSegueIdentifier<UIKit.UIStoryboardSegue, SearchResultVC, macrochallenge.searchPeopleVC> = Rswift.StoryboardSegueIdentifier(identifier: "searchPeopleSegue")

      #if os(iOS) || os(tvOS)
      /// Optionally returns a typed version of segue `searchPeopleSegue`.
      /// Returns nil if either the segue identifier, the source, destination, or segue types don't match.
      /// For use inside `prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)`.
      static func searchPeopleSegue(segue: UIKit.UIStoryboardSegue) -> Rswift.TypedStoryboardSegueInfo<UIKit.UIStoryboardSegue, SearchResultVC, macrochallenge.searchPeopleVC>? {
        return Rswift.TypedStoryboardSegueInfo(segueIdentifier: R.segue.searchResultVC.searchPeopleSegue, segue: segue)
      }
      #endif

      fileprivate init() {}
    }

    /// This struct is generated for `searchPeopleVC`, and contains static references to 2 segues.
    struct macrochallengeSearchPeopleVC {
      /// Segue identifier `showResult`.
      static let showResult: Rswift.StoryboardSegueIdentifier<UIKit.UIStoryboardSegue, macrochallenge.searchPeopleVC, SearchResultVC> = Rswift.StoryboardSegueIdentifier(identifier: "showResult")
      /// Segue identifier `unwindToResult`.
      static let unwindToResult: Rswift.StoryboardSegueIdentifier<UIKit.UIStoryboardSegue, macrochallenge.searchPeopleVC, UIKit.UIViewController> = Rswift.StoryboardSegueIdentifier(identifier: "unwindToResult")

      #if os(iOS) || os(tvOS)
      /// Optionally returns a typed version of segue `showResult`.
      /// Returns nil if either the segue identifier, the source, destination, or segue types don't match.
      /// For use inside `prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)`.
      static func showResult(segue: UIKit.UIStoryboardSegue) -> Rswift.TypedStoryboardSegueInfo<UIKit.UIStoryboardSegue, macrochallenge.searchPeopleVC, SearchResultVC>? {
        return Rswift.TypedStoryboardSegueInfo(segueIdentifier: R.segue.macrochallengeSearchPeopleVC.showResult, segue: segue)
      }
      #endif

      #if os(iOS) || os(tvOS)
      /// Optionally returns a typed version of segue `unwindToResult`.
      /// Returns nil if either the segue identifier, the source, destination, or segue types don't match.
      /// For use inside `prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)`.
      static func unwindToResult(segue: UIKit.UIStoryboardSegue) -> Rswift.TypedStoryboardSegueInfo<UIKit.UIStoryboardSegue, macrochallenge.searchPeopleVC, UIKit.UIViewController>? {
        return Rswift.TypedStoryboardSegueInfo(segueIdentifier: R.segue.macrochallengeSearchPeopleVC.unwindToResult, segue: segue)
      }
      #endif

      fileprivate init() {}
    }

    fileprivate init() {}
  }
  #endif

  #if os(iOS) || os(tvOS)
  /// This `R.storyboard` struct is generated, and contains static references to 8 storyboards.
  struct storyboard {
    /// Storyboard `Example`.
    static let example = _R.storyboard.example()
    /// Storyboard `Feed`.
    static let feed = _R.storyboard.feed()
    /// Storyboard `Feeds`.
    static let feeds = _R.storyboard.feeds()
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `Main`.
    static let main = _R.storyboard.main()
    /// Storyboard `SearchPeople`.
    static let searchPeople = _R.storyboard.searchPeople()
    /// Storyboard `SearchResult`.
    static let searchResult = _R.storyboard.searchResult()
    /// Storyboard `forgotPass`.
    static let forgotPass = _R.storyboard.forgotPass()

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "Example", bundle: ...)`
    static func example(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.example)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "Feed", bundle: ...)`
    static func feed(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.feed)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "Feeds", bundle: ...)`
    static func feeds(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.feeds)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "Main", bundle: ...)`
    static func main(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.main)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "SearchPeople", bundle: ...)`
    static func searchPeople(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.searchPeople)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "SearchResult", bundle: ...)`
    static func searchResult(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.searchResult)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "forgotPass", bundle: ...)`
    static func forgotPass(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.forgotPass)
    }
    #endif

    fileprivate init() {}
  }
  #endif

  /// This `R.entitlements` struct is generated, and contains static references to 1 properties.
  struct entitlements {
    struct comAppleDeveloperApplesignin {
      static let `default` = infoPlistString(path: ["com.apple.developer.applesignin"], key: "Default") ?? "Default"

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  /// This `R.file` struct is generated, and contains static references to 6 files.
  struct file {
    /// Resource file `GoogleService-Info.plist`.
    static let googleServiceInfoPlist = Rswift.FileResource(bundle: R.hostingBundle, name: "GoogleService-Info", pathExtension: "plist")
    /// Resource file `Hind-Bold.ttf`.
    static let hindBoldTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "Hind-Bold", pathExtension: "ttf")
    /// Resource file `Hind-Light.ttf`.
    static let hindLightTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "Hind-Light", pathExtension: "ttf")
    /// Resource file `Hind-Medium.ttf`.
    static let hindMediumTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "Hind-Medium", pathExtension: "ttf")
    /// Resource file `Hind-Regular.ttf`.
    static let hindRegularTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "Hind-Regular", pathExtension: "ttf")
    /// Resource file `Hind-SemiBold.ttf`.
    static let hindSemiBoldTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "Hind-SemiBold", pathExtension: "ttf")

    /// `bundle.url(forResource: "GoogleService-Info", withExtension: "plist")`
    static func googleServiceInfoPlist(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.googleServiceInfoPlist
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "Hind-Bold", withExtension: "ttf")`
    static func hindBoldTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.hindBoldTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "Hind-Light", withExtension: "ttf")`
    static func hindLightTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.hindLightTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "Hind-Medium", withExtension: "ttf")`
    static func hindMediumTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.hindMediumTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "Hind-Regular", withExtension: "ttf")`
    static func hindRegularTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.hindRegularTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "Hind-SemiBold", withExtension: "ttf")`
    static func hindSemiBoldTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.hindSemiBoldTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    fileprivate init() {}
  }

  /// This `R.font` struct is generated, and contains static references to 5 fonts.
  struct font: Rswift.Validatable {
    /// Font `Hind-Bold`.
    static let hindBold = Rswift.FontResource(fontName: "Hind-Bold")
    /// Font `Hind-Light`.
    static let hindLight = Rswift.FontResource(fontName: "Hind-Light")
    /// Font `Hind-Medium`.
    static let hindMedium = Rswift.FontResource(fontName: "Hind-Medium")
    /// Font `Hind-Regular`.
    static let hindRegular = Rswift.FontResource(fontName: "Hind-Regular")
    /// Font `Hind-SemiBold`.
    static let hindSemiBold = Rswift.FontResource(fontName: "Hind-SemiBold")

    /// `UIFont(name: "Hind-Bold", size: ...)`
    static func hindBold(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: hindBold, size: size)
    }

    /// `UIFont(name: "Hind-Light", size: ...)`
    static func hindLight(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: hindLight, size: size)
    }

    /// `UIFont(name: "Hind-Medium", size: ...)`
    static func hindMedium(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: hindMedium, size: size)
    }

    /// `UIFont(name: "Hind-Regular", size: ...)`
    static func hindRegular(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: hindRegular, size: size)
    }

    /// `UIFont(name: "Hind-SemiBold", size: ...)`
    static func hindSemiBold(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: hindSemiBold, size: size)
    }

    static func validate() throws {
      if R.font.hindBold(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'Hind-Bold' could not be loaded, is 'Hind-Bold.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.hindLight(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'Hind-Light' could not be loaded, is 'Hind-Light.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.hindMedium(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'Hind-Medium' could not be loaded, is 'Hind-Medium.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.hindRegular(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'Hind-Regular' could not be loaded, is 'Hind-Regular.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.hindSemiBold(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'Hind-SemiBold' could not be loaded, is 'Hind-SemiBold.ttf' added to the UIAppFonts array in this targets Info.plist?") }
    }

    fileprivate init() {}
  }

  /// This `R.image` struct is generated, and contains static references to 9 images.
  struct image {
    /// Image `Add`.
    static let add = Rswift.ImageResource(bundle: R.hostingBundle, name: "Add")
    /// Image `Awesome`.
    static let awesome = Rswift.ImageResource(bundle: R.hostingBundle, name: "Awesome")
    /// Image `Filter`.
    static let filter = Rswift.ImageResource(bundle: R.hostingBundle, name: "Filter")
    /// Image `Friendly`.
    static let friendly = Rswift.ImageResource(bundle: R.hostingBundle, name: "Friendly")
    /// Image `Great Work`.
    static let greatWork = Rswift.ImageResource(bundle: R.hostingBundle, name: "Great Work")
    /// Image `Icon`.
    static let icon = Rswift.ImageResource(bundle: R.hostingBundle, name: "Icon")
    /// Image `Line 1`.
    static let line1 = Rswift.ImageResource(bundle: R.hostingBundle, name: "Line 1")
    /// Image `Team Leader`.
    static let teamLeader = Rswift.ImageResource(bundle: R.hostingBundle, name: "Team Leader")
    /// Image `pp`.
    static let pp = Rswift.ImageResource(bundle: R.hostingBundle, name: "pp")

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "Add", bundle: ..., traitCollection: ...)`
    static func add(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.add, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "Awesome", bundle: ..., traitCollection: ...)`
    static func awesome(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.awesome, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "Filter", bundle: ..., traitCollection: ...)`
    static func filter(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.filter, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "Friendly", bundle: ..., traitCollection: ...)`
    static func friendly(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.friendly, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "Great Work", bundle: ..., traitCollection: ...)`
    static func greatWork(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.greatWork, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "Icon", bundle: ..., traitCollection: ...)`
    static func icon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.icon, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "Line 1", bundle: ..., traitCollection: ...)`
    static func line1(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.line1, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "Team Leader", bundle: ..., traitCollection: ...)`
    static func teamLeader(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.teamLeader, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "pp", bundle: ..., traitCollection: ...)`
    static func pp(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.pp, compatibleWith: traitCollection)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.info` struct is generated, and contains static references to 1 properties.
  struct info {
    struct uiApplicationSceneManifest {
      static let _key = "UIApplicationSceneManifest"
      static let uiApplicationSupportsMultipleScenes = false

      struct uiSceneConfigurations {
        static let _key = "UISceneConfigurations"

        struct uiWindowSceneSessionRoleApplication {
          struct defaultConfiguration {
            static let _key = "Default Configuration"
            static let uiSceneConfigurationName = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneConfigurationName") ?? "Default Configuration"
            static let uiSceneDelegateClassName = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneDelegateClassName") ?? "$(PRODUCT_MODULE_NAME).SceneDelegate"
            static let uiSceneStoryboardFile = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneStoryboardFile") ?? "Main"

            fileprivate init() {}
          }

          fileprivate init() {}
        }

        fileprivate init() {}
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  /// This `R.nib` struct is generated, and contains static references to 6 nibs.
  struct nib {
    /// Nib `GameDetailViewController`.
    static let gameDetailViewController = _R.nib._GameDetailViewController()
    /// Nib `GameTableViewCell`.
    static let gameTableViewCell = _R.nib._GameTableViewCell()
    /// Nib `SecondExampleViewController`.
    static let secondExampleViewController = _R.nib._SecondExampleViewController()
    /// Nib `SignInViewController`.
    static let signInViewController = _R.nib._SignInViewController()
    /// Nib `searchForPlayerVC`.
    static let searchForPlayerVC = _R.nib._searchForPlayerVC()
    /// Nib `searchForTeamVC`.
    static let searchForTeamVC = _R.nib._searchForTeamVC()

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "GameDetailViewController", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.gameDetailViewController) instead")
    static func gameDetailViewController(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.gameDetailViewController)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "GameTableViewCell", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.gameTableViewCell) instead")
    static func gameTableViewCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.gameTableViewCell)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "SecondExampleViewController", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.secondExampleViewController) instead")
    static func secondExampleViewController(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.secondExampleViewController)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "SignInViewController", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.signInViewController) instead")
    static func signInViewController(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.signInViewController)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "searchForPlayerVC", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.searchForPlayerVC) instead")
    static func searchForPlayerVC(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.searchForPlayerVC)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "searchForTeamVC", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.searchForTeamVC) instead")
    static func searchForTeamVC(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.searchForTeamVC)
    }
    #endif

    static func gameDetailViewController(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
      return R.nib.gameDetailViewController.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
    }

    static func gameTableViewCell(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> GameTableViewCell? {
      return R.nib.gameTableViewCell.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? GameTableViewCell
    }

    static func searchForPlayerVC(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
      return R.nib.searchForPlayerVC.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
    }

    static func searchForTeamVC(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
      return R.nib.searchForTeamVC.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
    }

    static func secondExampleViewController(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
      return R.nib.secondExampleViewController.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
    }

    static func signInViewController(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
      return R.nib.signInViewController.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
    }

    fileprivate init() {}
  }

  /// This `R.reuseIdentifier` struct is generated, and contains static references to 3 reuse identifiers.
  struct reuseIdentifier {
    /// Reuse identifier `postCell`.
    static let postCell: Rswift.ReuseIdentifier<PostTableViewCell> = Rswift.ReuseIdentifier(identifier: "postCell")
    /// Reuse identifier `recommendedCell`.
    static let recommendedCell: Rswift.ReuseIdentifier<RecommendedCollectionViewCell> = Rswift.ReuseIdentifier(identifier: "recommendedCell")
    /// Reuse identifier `resultCell`.
    static let resultCell: Rswift.ReuseIdentifier<ResultTableViewCell> = Rswift.ReuseIdentifier(identifier: "resultCell")

    fileprivate init() {}
  }

  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }

    fileprivate init() {}
  }

  fileprivate class Class {}

  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    #if os(iOS) || os(tvOS)
    try nib.validate()
    #endif
    #if os(iOS) || os(tvOS)
    try storyboard.validate()
    #endif
  }

  #if os(iOS) || os(tvOS)
  struct nib: Rswift.Validatable {
    static func validate() throws {
      try _searchForPlayerVC.validate()
      try _searchForTeamVC.validate()
    }

    struct _GameDetailViewController: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "GameDetailViewController"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }

      fileprivate init() {}
    }

    struct _GameTableViewCell: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "GameTableViewCell"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> GameTableViewCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? GameTableViewCell
      }

      fileprivate init() {}
    }

    struct _SecondExampleViewController: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "SecondExampleViewController"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }

      fileprivate init() {}
    }

    struct _SignInViewController: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "SignInViewController"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }

      fileprivate init() {}
    }

    struct _searchForPlayerVC: Rswift.NibResourceType, Rswift.Validatable {
      let bundle = R.hostingBundle
      let name = "searchForPlayerVC"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }

      static func validate() throws {
        if UIKit.UIImage(named: "Awesome", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'Awesome' is used in nib 'searchForPlayerVC', but couldn't be loaded.") }
        if UIKit.UIImage(named: "Friendly", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'Friendly' is used in nib 'searchForPlayerVC', but couldn't be loaded.") }
        if UIKit.UIImage(named: "Great Work", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'Great Work' is used in nib 'searchForPlayerVC', but couldn't be loaded.") }
        if UIKit.UIImage(named: "Team Leader", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'Team Leader' is used in nib 'searchForPlayerVC', but couldn't be loaded.") }
        if UIKit.UIImage(named: "chevron.down", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'chevron.down' is used in nib 'searchForPlayerVC', but couldn't be loaded.") }
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }

    struct _searchForTeamVC: Rswift.NibResourceType, Rswift.Validatable {
      let bundle = R.hostingBundle
      let name = "searchForTeamVC"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }

      static func validate() throws {
        if UIKit.UIImage(named: "chevron.down", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'chevron.down' is used in nib 'searchForTeamVC', but couldn't be loaded.") }
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }
  #endif

  #if os(iOS) || os(tvOS)
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      #if os(iOS) || os(tvOS)
      try example.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try feed.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try feeds.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try launchScreen.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try main.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try searchPeople.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try searchResult.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try forgotPass.validate()
      #endif
    }

    #if os(iOS) || os(tvOS)
    struct example: Rswift.StoryboardResourceType, Rswift.Validatable {
      let bundle = R.hostingBundle
      let exampleViewController = StoryboardViewControllerResource<ExampleViewController>(identifier: "ExampleViewController")
      let name = "Example"

      func exampleViewController(_: Void = ()) -> ExampleViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: exampleViewController)
      }

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
        if _R.storyboard.example().exampleViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'exampleViewController' could not be loaded from storyboard 'Example' as 'ExampleViewController'.") }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct feed: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = FeedVC

      let bundle = R.hostingBundle
      let feedVC = StoryboardViewControllerResource<FeedVC>(identifier: "FeedVC")
      let name = "Feed"

      func feedVC(_: Void = ()) -> FeedVC? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: feedVC)
      }

      static func validate() throws {
        if UIKit.UIImage(named: "Add", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'Add' is used in storyboard 'Feed', but couldn't be loaded.") }
        if UIKit.UIImage(named: "Filter", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'Filter' is used in storyboard 'Feed', but couldn't be loaded.") }
        if UIKit.UIImage(named: "Line 1", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'Line 1' is used in storyboard 'Feed', but couldn't be loaded.") }
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
        if _R.storyboard.feed().feedVC() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'feedVC' could not be loaded from storyboard 'Feed' as 'FeedVC'.") }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct feeds: Rswift.StoryboardResourceType, Rswift.Validatable {
      let bundle = R.hostingBundle
      let feedViewController = StoryboardViewControllerResource<FeedViewController>(identifier: "FeedViewController")
      let name = "Feeds"

      func feedViewController(_: Void = ()) -> FeedViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: feedViewController)
      }

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
        if _R.storyboard.feeds().feedViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'feedViewController' could not be loaded from storyboard 'Feeds' as 'FeedViewController'.") }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct forgotPass: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = forgotPassVC

      let bundle = R.hostingBundle
      let name = "forgotPass"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController

      let bundle = R.hostingBundle
      let name = "LaunchScreen"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct main: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = MainViewController

      let bundle = R.hostingBundle
      let mainViewController = StoryboardViewControllerResource<MainViewController>(identifier: "MainViewController")
      let name = "Main"

      func mainViewController(_: Void = ()) -> MainViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: mainViewController)
      }

      static func validate() throws {
        if UIKit.UIImage(named: "person.circle", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'person.circle' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "person.circle.fill", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'person.circle.fill' is used in storyboard 'Main', but couldn't be loaded.") }
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
        if _R.storyboard.main().mainViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'mainViewController' could not be loaded from storyboard 'Main' as 'MainViewController'.") }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct searchPeople: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = macrochallenge.searchPeopleVC

      let bundle = R.hostingBundle
      let name = "SearchPeople"
      let searchPeople = StoryboardViewControllerResource<macrochallenge.searchPeopleVC>(identifier: "SearchPeople")

      func searchPeople(_: Void = ()) -> macrochallenge.searchPeopleVC? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: searchPeople)
      }

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
        if _R.storyboard.searchPeople().searchPeople() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'searchPeople' could not be loaded from storyboard 'SearchPeople' as 'macrochallenge.searchPeopleVC'.") }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct searchResult: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = SearchResultVC

      let bundle = R.hostingBundle
      let name = "SearchResult"

      static func validate() throws {
        if UIKit.UIImage(named: "pp", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'pp' is used in storyboard 'SearchResult', but couldn't be loaded.") }
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    fileprivate init() {}
  }
  #endif

  fileprivate init() {}
}
