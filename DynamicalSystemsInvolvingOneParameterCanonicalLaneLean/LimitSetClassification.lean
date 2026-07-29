import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterCanonicalLaneLean

structure LimitSetClassificationPackage (X : Type u) [TopologicalSpace X] (F : OneParameterFlowBasicPackage X) where
  omegaLimitSets : Set X → Set (Set X)
  alphaLimitSets : Set X → Set (Set X)
  nonwanderingSet : Set X
  recurrentPoints : Set X
  limitSetProperties : ∀ S : Set X, 
    (∀ ω ∈ omegaLimitSets S, ω ⊆ closure S ∧ Nonempty ω ∧ IsCompact ω ∧ IsInvariant F.flow.evolutionMap ω) ∧
    (∀ α ∈ alphaLimitSets S, α ⊆ closure S ∧ Nonempty α ∧ IsCompact α ∧ IsInvariant F.flow.evolutionMap α)
  nonwanderingClosed : IsClosed nonwanderingSet ∧ IsInvariant F.flow.evolutionMap nonwanderingSet

def LimitSetClassificationClosed {X : Type u} [TopologicalSpace X] {F : OneParameterFlowBasicPackage X}
    (L : LimitSetClassificationPackage X F) : Prop :=
  L.limitSetProperties ∧ L.nonwanderingClosed.1 ∧ L.nonwanderingClosed.2

theorem limit_set_classification_closed_iff {X : Type u} [TopologicalSpace X] {F : OneParameterFlowBasicPackage X}
    (L : LimitSetClassificationPackage X F) : LimitSetClassificationClosed L := by
  refine And.intro L.limitSetProperties (And.intro L.nonwanderingClosed.1 L.nonwanderingClosed.2)

end DynamicalSystemsInvolvingOneParameterCanonicalLaneLean
end HautevilleHouse