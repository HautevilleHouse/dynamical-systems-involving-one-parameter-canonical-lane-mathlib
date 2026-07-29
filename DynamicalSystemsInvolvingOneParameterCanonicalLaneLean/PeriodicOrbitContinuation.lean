import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterCanonicalLaneLean

structure PeriodicOrbitContinuationPackage where
  parameterRange : Set ℝ
  periodicOrbitFamily : ℝ → stateSpace → Prop
  periodFunction : ℝ → ℝ
  continuationTheorem : Prop
  crossingLimit : Prop

structure PeriodicOrbitContinuationEvidence (P : PeriodicOrbitContinuationPackage) where
  parameterRangeClosed : P.parameterRange = Set.Ioo 0 1
  periodicOrbitFamilyClosed : ∀ (μ : ℝ) (x : stateSpace), P.periodicOrbitFamily μ x → x ≠ 0
  periodFunctionContinuous : Continuous P.periodFunction
  continuationTheoremClosed : P.continuationTheorem
  crossingLimitClosed : P.crossingLimit

def PeriodicOrbitContinuationClosed (P : PeriodicOrbitContinuationPackage) : Prop :=
  P.parameterRange = Set.Ioo 0 1 ∧ (∀ (μ : ℝ) (x : stateSpace), P.periodicOrbitFamily μ x → x ≠ 0) ∧
  Continuous P.periodFunction ∧ P.continuationTheorem ∧ P.crossingLimit

theorem periodic_orbit_continuation_closed_from_evidence
    (P : PeriodicOrbitContinuationPackage) (E : PeriodicOrbitContinuationEvidence P) :
    PeriodicOrbitContinuationClosed P := by
  exact And.intro E.parameterRangeClosed
    (And.intro E.periodicOrbitFamilyClosed
      (And.intro E.periodFunctionContinuous
        (And.intro E.continuationTheoremClosed E.crossingLimitClosed)))

end DynamicalSystemsInvolvingOneParameterCanonicalLaneLean
end HautevilleHouse
