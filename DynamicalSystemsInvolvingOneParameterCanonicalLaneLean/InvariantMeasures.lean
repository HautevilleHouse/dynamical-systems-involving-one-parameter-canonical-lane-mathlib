import canonicalLaneMathlib.AdmissibleClass
import DynamicalSystemsInvolvingOneParameterCanonicalLaneLean.OneParameterFlow

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterCanonicalLaneLean

structure InvariantMeasuresPackage {F : OneParameterFlowPackage} where
  invariantMeasureExists : Prop
  ergodicityProperties : Prop
  entropyProduction : Prop

structure InvariantMeasuresEvidence {F : OneParameterFlowPackage}
    (I : InvariantMeasuresPackage F) where
  invariantMeasureExistsClosed : I.invariantMeasureExists
  ergodicityPropertiesClosed : I.ergodicityProperties
  entropyProductionClosed : I.entropyProduction

def InvariantMeasuresClosed {F : OneParameterFlowPackage}
    (I : InvariantMeasuresPackage F) : Prop :=
  I.invariantMeasureExists ∧ I.ergodicityProperties ∧ I.entropyProduction

theorem invariant_measures_closed_from_evidence
    {F : OneParameterFlowPackage} (I : InvariantMeasuresPackage F)
    (E : InvariantMeasuresEvidence I) : InvariantMeasuresClosed I := by
  exact And.intro E.invariantMeasureExistsClosed
    (And.intro E.ergodicityPropertiesClosed E.entropyProductionClosed)

end DynamicalSystemsInvolvingOneParameterCanonicalLaneLean
end HautevilleHouse
