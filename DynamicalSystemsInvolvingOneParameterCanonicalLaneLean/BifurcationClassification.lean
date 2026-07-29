import canonicalLaneMathlib.AdmissibleClass
import DynamicalSystemsInvolvingOneParameterCanonicalLaneLean.OneParameterFlow

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterCanonicalLaneLean

structure BifurcationClassificationPackage {F : OneParameterFlowPackage} where
  fixedPointsClassified : Prop
  bifurcationPointsDetected : Prop
  stabilityAnalyzed : Prop
  normalFormDerived : Prop

structure BifurcationClassificationEvidence {F : OneParameterFlowPackage}
    (B : BifurcationClassificationPackage F) where
  fixedPointsClassifiedClosed : B.fixedPointsClassified
  bifurcationPointsDetectedClosed : B.bifurcationPointsDetected
  stabilityAnalyzedClosed : B.stabilityAnalyzed
  normalFormDerivedClosed : B.normalFormDerived

def BifurcationClassificationClosed {F : OneParameterFlowPackage}
    (B : BifurcationClassificationPackage F) : Prop :=
  B.fixedPointsClassified ∧ B.bifurcationPointsDetected ∧
  B.stabilityAnalyzed ∧ B.normalFormDerived

theorem bifurcation_classification_closed_from_evidence
    {F : OneParameterFlowPackage} (B : BifurcationClassificationPackage F)
    (E : BifurcationClassificationEvidence B) : BifurcationClassificationClosed B := by
  exact And.intro E.fixedPointsClassifiedClosed
    (And.intro E.bifurcationPointsDetectedClosed
      (And.intro E.stabilityAnalyzedClosed E.normalFormDerivedClosed))

end DynamicalSystemsInvolvingOneParameterCanonicalLaneLean
end HautevilleHouse
