import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterCanonicalLaneLean

structure StabilityAnalysisPackage (X : Type u) [TopologicalSpace X] [MetricSpace X] (F : OneParameterFlowBasicPackage X) where
  lyapunovFunctions : Set (X → ℝ)
  asymptoticStablePoints : Set X
  exponentialStablePoints : Set X
  lyapunovStablePoints : Set X
  lyapunovCondition : ∀ V ∈ lyapunovFunctions, ∀ x ∈ lyapunovStablePoints, 
    (V x = 0) ∧ (∀ y ≠ x, V y > 0) ∧ (∀ t > F.flow.startTime, V (F.flow.evolutionMap t x) < V x)
  asymptoticCondition : ∀ x ∈ asymptoticStablePoints, 
    x ∈ lyapunovStablePoints ∧ ∃ δ > 0, ∀ y, dist x y < δ → Limit (F.flow.evolutionMap · y) (atTop) x

def StabilityClosed {X : Type u} [TopologicalSpace X] [MetricSpace X] {F : OneParameterFlowBasicPackage X}
    (S : StabilityAnalysisPackage X F) : Prop :=
  S.lyapunovCondition ∧ S.asymptoticCondition

theorem stability_closed_iff {X : Type u} [TopologicalSpace X] [MetricSpace X] {F : OneParameterFlowBasicPackage X}
    (S : StabilityAnalysisPackage X F) : StabilityClosed S := by
  exact And.intro S.lyapunovCondition S.asymptoticCondition

end DynamicalSystemsInvolvingOneParameterCanonicalLaneLean
end HautevilleHouse