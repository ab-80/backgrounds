//
//  HealthKitManager.swift
//  backgrounds
//
//  Created by Andrew Bergerson on 6/23/22.
//

import Foundation
import HealthKit

public class HealthstoreManager {
    private var _healthstoreAccessible: Bool = false
    private var _healthstore: HKHealthStore!
    
    init() {
        if HKHealthStore.isHealthDataAvailable() {
            _healthstoreAccessible = true
            _healthstore = HKHealthStore()
        }
        // else: _healthstoreAccessible remains false
    }
    
    public func healthstoreAccessible() -> Bool {
        return _healthstoreAccessible
    }
    
    func requestAuthorization(completion: @escaping (Bool) -> Void) {
        let healthKitTypesToRead : Set<HKObjectType> = [
            HKSampleType.quantityType(forIdentifier: HKQuantityTypeIdentifier.height)!,
            HKSampleType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bodyMass)!,
            HKSampleType.characteristicType(forIdentifier: HKCharacteristicTypeIdentifier.dateOfBirth)!,
            HKSampleType.workoutType(),
            HKSampleType.activitySummaryType()
        ]

        let healthKitTypesToWrite: Set<HKSampleType> = [
            HKSampleType.quantityType(forIdentifier: HKQuantityTypeIdentifier.height)!,
            HKSampleType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bodyMass)!,
        ]

        if !HKHealthStore.isHealthDataAvailable() {
            print("Error: HealthKit is not available in this Device")
            return
        }

        _healthstore.requestAuthorization(toShare: healthKitTypesToWrite, read: healthKitTypesToRead) { (success, error) in print("Request Authorization -- Success: ", success, " Error: ", error ?? "nil")
        }
    }
}
