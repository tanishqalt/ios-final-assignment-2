//
//  Beer+CoreDataProperties.swift
//  BeerApp
//
//  Created by Tanishq Sharma on 2022-04-17.
//
//

import Foundation
import CoreData


extension Beer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Beer> {
        return NSFetchRequest<Beer>(entityName: "Beer")
    }

    @NSManaged public var name: String?
    @NSManaged public var beerDescription: String?
    @NSManaged public var tagline: String?

}

extension Beer : Identifiable {

}
