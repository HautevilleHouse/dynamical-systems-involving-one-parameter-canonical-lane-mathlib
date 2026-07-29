import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterCanonicalLaneLean

structure PhasePortraitPackage (X : Type u) [TopologicalSpace X] (F : OneParameterFlowBasicPackage X) where
  equilibriumPoints : Set X
  periodicOrbits : Set (Set X)
  limitCycles : Set (Set X)
  separatrices : Set (Set X)
  classificationComplete : Prop
  equilibriumPointsClassified : ∀ x ∈ equilibriumPoints, ∀ t, F.flow.evolutionMap t x = x
  periodicOrbitsClassified : ∀ γ ∈ periodicOrbits, ∃ T > 0, ∀ x ∈ γ, F.flow.evolutionMap T x = x

structure PhasePortraitEvidence {X : Type u} [TopologicalSpace X] {F : OneParameterFlowBasicPackage X} (P : PhasePortraitPackage X F) where
  equilibriumPointsClassifiedClosed : P.equilibriumPointsClassified
  periodicOrbitsClassifiedClosed : P.periodicOrbitsClassified
  classificationCompleteClosed : P.classificationComplete

def PhasePortraitClosed {X : Type u} [TopologicalSpace X] {F : OneParameterFlowBasicPackage X} (P : PhasePortraitPackage X F) : Prop :=
  P.equilibriumPointsClassified ∧ P.periodicOrbitsClassified ∧ P.classificationComplete

theorem phase_portrait_closed_from_evidence {X : Type u} [TopologicalSpace X] {F : OneParameterFlowBasicPackage X}
    (P : PhasePortraitPackage X F) (E : PhasePortraitEvidence P) : PhasePortraitClosed P := by
  exact And.intro E.equilibriumPointsClassifiedClosed
    (And.intro E.periodicOrbitsClassifiedClosed E.classificationCompleteClosed)

end DynamicalSystemsInvolvingOneParameterCanonicalLaneLean
end HautevilleHouse