import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsInvolvingOneParameterCanonicalLaneLean.OneParameterFlow

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterCanonicalLaneLean

structure InvariantManifoldPackage {X : Type u} [TopologicalSpace X] (F : OneParameterFlow X) where
  fixedPoint : X
  fixedPointInvariant : ∀ (t : F.time), F.phi t fixedPoint = fixedPoint
  stableManifold : Set X
  unstableManifold : Set X
  centerManifold : Set X
  stableInvariant : ∀ (t : F.time) (x : X), x ∈ stableManifold → F.phi t x ∈ stableManifold
  unstableInvariant : ∀ (t : F.time) (x : X), x ∈ unstableManifold → F.phi t x ∈ unstableManifold
  centerInvariant : ∀ (t : F.time) (x : X), x ∈ centerManifold → F.phi t x ∈ centerManifold
  stableAttracts : ∀ (U : Set X) (hU : U ∈ nhds fixedPoint), ∃ (t : F.time), F.phi t (stableManifold ∩ U) ⊆ stableManifold
  unstableExpands : ∀ (U : Set X) (hU : U ∈ nhds fixedPoint), ∃ (t : F.time), F.phi t (unstableManifold ∩ U) ⊇ unstableManifold

structure InvariantManifoldEvidence {X : Type u} [TopologicalSpace X] {F : OneParameterFlow X}
    (I : InvariantManifoldPackage F) where
  stableInvariantClosed : I.stableInvariant
  unstableInvariantClosed : I.unstableInvariant
  centerInvariantClosed : I.centerInvariant
  stableAttractsClosed : I.stableAttracts
  unstableExpandsClosed : I.unstableExpands

def InvariantManifoldClosed {X : Type u} [TopologicalSpace X] {F : OneParameterFlow X}
    (I : InvariantManifoldPackage F) : Prop :=
  I.stableInvariant ∧ I.unstableInvariant ∧ I.centerInvariant ∧ I.stableAttracts ∧ I.unstableExpands

theorem invariant_manifold_closed_from_evidence {X : Type u} [TopologicalSpace X] {F : OneParameterFlow X}
    (I : InvariantManifoldPackage F) (E : InvariantManifoldEvidence I) : InvariantManifoldClosed I := by
  exact And.intro E.stableInvariantClosed
    (And.intro E.unstableInvariantClosed
      (And.intro E.centerInvariantClosed
        (And.intro E.stableAttractsClosed E.unstableExpandsClosed)))

end DynamicalSystemsInvolvingOneParameterCanonicalLaneLean
end HautevilleHouse