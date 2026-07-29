import canonicalLaneMathlib.AdmissibleClass
import DynamicalSystemsInvolvingOneParameterCanonicalLaneLean.OneParameterFlow

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterCanonicalLaneLean

structure PeriodicOrbitsPackage {F : OneParameterFlowPackage} where
  periodicOrbitsExist : Prop
  periodBounds : Prop
  stabilityCriteria : Prop

structure PeriodicOrbitsEvidence {F : OneParameterFlowPackage}
    (P : PeriodicOrbitsPackage F) where
  periodicOrbitsExistClosed : P.periodicOrbitsExist
  periodBoundsClosed : P.periodBounds
  stabilityCriteriaClosed : P.stabilityCriteria

def PeriodicOrbitsClosed {F : OneParameterFlowPackage}
    (P : PeriodicOrbitsPackage F) : Prop :=
  P.periodicOrbitsExist ∧ P.periodBounds ∧ P.stabilityCriteria

theorem periodic_orbits_closed_from_evidence
    {F : OneParameterFlowPackage} (P : PeriodicOrbitsPackage F)
    (E : PeriodicOrbitsEvidence P) : PeriodicOrbitsClosed P := by
  exact And.intro E.periodicOrbitsExistClosed
    (And.intro E.periodBoundsClosed E.stabilityCriteriaClosed)

end DynamicalSystemsInvolvingOneParameterCanonicalLaneLean
end HautevilleHouse
