import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterCanonicalLaneLean

structure StructuralStability (X : Type u) [TopologicalSpace X] where
  dynamics : X → X
  parameter : ℝ
  structurallyStable : Prop
  omegaStability : Prop
  robustnessOfHyperbolicity : Prop

structure StructuralStabilityEvidence (X : Type u) [TopologicalSpace X]
    (S : StructuralStability X) where
  structurallyStableClosed : S.structurallyStable
  omegaStabilityClosed : S.omegaStability
  robustnessOfHyperbolicityClosed : S.robustnessOfHyperbolicity

def StructuralStabilityClosed (X : Type u) [TopologicalSpace X] (S : StructuralStability X) : Prop :=
  S.structurallyStable ∧ S.omegaStability ∧ S.robustnessOfHyperbolicity

theorem structural_stability_closed_from_evidence {X : Type u} [TopologicalSpace X]
    (S : StructuralStability X) (E : StructuralStabilityEvidence X S) :
    StructuralStabilityClosed X S := by
  exact And.intro E.structurallyStableClosed
    (And.intro E.omegaStabilityClosed E.robustnessOfHyperbolicityClosed)

end DynamicalSystemsInvolvingOneParameterCanonicalLaneLean
end HautevilleHouse