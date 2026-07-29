import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterCanonicalLaneLean

structure HyperbolicityAnalysis (X : Type u) [TopologicalSpace X] where
  dynamics : X → X
  parameter : ℝ
  hyperbolicSet : Set X
  uniformHyperbolicity : Prop
  stableUnstableManifolds : Prop
  spectralDecomposition : Prop

structure HyperbolicityEvidence (X : Type u) [TopologicalSpace X]
    (H : HyperbolicityAnalysis X) where
  uniformHyperbolicityClosed : H.uniformHyperbolicity
  stableUnstableManifoldsClosed : H.stableUnstableManifolds
  spectralDecompositionClosed : H.spectralDecomposition

def HyperbolicityClosed (X : Type u) [TopologicalSpace X] (H : HyperbolicityAnalysis X) : Prop :=
  H.uniformHyperbolicity ∧ H.stableUnstableManifolds ∧ H.spectralDecomposition

theorem hyperbolicity_closed_from_evidence {X : Type u} [TopologicalSpace X]
    (H : HyperbolicityAnalysis X) (E : HyperbolicityEvidence X H) : HyperbolicityClosed X H := by
  exact And.intro E.uniformHyperbolicityClosed
    (And.intro E.stableUnstableManifoldsClosed E.spectralDecompositionClosed)

end DynamicalSystemsInvolvingOneParameterCanonicalLaneLean
end HautevilleHouse