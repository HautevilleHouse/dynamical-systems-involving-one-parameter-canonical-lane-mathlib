import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterCanonicalLaneLean

structure BifurcationAnalysisPackage {F : OneParameterFlowPackage} where
  parameterValue : F.parameter
  equilibriumSet : Set (F.stateSpace)
  stabilityChange : Prop
  bifurcationPoint : Prop
  normalForm : Prop
  typeClassification : String

structure BifurcationAnalysisEvidence {F : OneParameterFlowPackage}
    (B : BifurcationAnalysisPackage F) where
  stabilityChangeClosed : B.stabilityChange
  bifurcationPointClosed : B.bifurcationPoint
  normalFormClosed : B.normalForm
  typeClassificationClosed : B.typeClassification = "saddle-node" ∨ B.typeClassification = "pitchfork" ∨ B.typeClassification = "transcritical" ∨ B.typeClassification = "Hopf"

def BifurcationAnalysisClosed {F : OneParameterFlowPackage}
    (B : BifurcationAnalysisPackage F) : Prop :=
  B.stabilityChange ∧ B.bifurcationPoint ∧ B.normalForm ∧ (B.typeClassification = "saddle-node" ∨ B.typeClassification = "pitchfork" ∨ B.typeClassification = "transcritical" ∨ B.typeClassification = "Hopf")

theorem bifurcation_analysis_closed_from_evidence {F : OneParameterFlowPackage}
    (B : BifurcationAnalysisPackage F) (E : BifurcationAnalysisEvidence B) :
    BifurcationAnalysisClosed B := by
  exact And.intro E.stabilityChangeClosed
    (And.intro E.bifurcationPointClosed
      (And.intro E.normalFormClosed E.typeClassificationClosed))

end DynamicalSystemsInvolvingOneParameterCanonicalLaneLean
end HautevilleHouse