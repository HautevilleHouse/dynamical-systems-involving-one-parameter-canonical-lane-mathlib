import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsInvolvingOneParameterCanonicalLaneLean.OneParameterFlow

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterCanonicalLaneLean

structure PoincareMapPackage {X : Type u} [TopologicalSpace X] (F : OneParameterFlow X) where
  sectionS : Set X
  sectionSSubmanifold : Submanifold (ModelWithCorners ℝ (Fin (n-1)) X) sectionS
  returnTime : sectionS → F.time
  returnMap : sectionS → sectionS
  returnTimeContinuous : Continuous returnTime
  returnMapContinuous : Continuous returnMap
  returnTimePos : ∀ (x : sectionS), returnTime x > 0
  firstReturn : ∀ (x : sectionS), F.phi (returnTime x) x.1 = (returnMap x).1
  returnTimeInvariant : ∀ (x : sectionS), returnMap (returnMap x) = returnMap x

structure PoincareMapEvidence {X : Type u} [TopologicalSpace X] {F : OneParameterFlow X}
    (P : PoincareMapPackage F) where
  returnTimeContinuousClosed : Continuous P.returnTime
  returnMapContinuousClosed : Continuous P.returnMap
  returnTimePosClosed : ∀ (x : P.sectionS), P.returnTime x > 0
  firstReturnClosed : ∀ (x : P.sectionS), F.phi (P.returnTime x) x.1 = (P.returnMap x).1
  returnTimeInvariantClosed : ∀ (x : P.sectionS), P.returnMap (P.returnMap x) = P.returnMap x

def PoincareMapClosed {X : Type u} [TopologicalSpace X] {F : OneParameterFlow X}
    (P : PoincareMapPackage F) : Prop :=
  Continuous P.returnTime ∧ Continuous P.returnMap ∧
  (∀ (x : P.sectionS), P.returnTime x > 0) ∧
  (∀ (x : P.sectionS), F.phi (P.returnTime x) x.1 = (P.returnMap x).1) ∧
  (∀ (x : P.sectionS), P.returnMap (P.returnMap x) = P.returnMap x)

theorem poincare_map_closed_from_evidence {X : Type u} [TopologicalSpace X] {F : OneParameterFlow X}
    (P : PoincareMapPackage F) (E : PoincareMapEvidence P) : PoincareMapClosed P := by
  exact And.intro E.returnTimeContinuousClosed
    (And.intro E.returnMapContinuousClosed
      (And.intro E.returnTimePosClosed
        (And.intro E.firstReturnClosed E.returnTimeInvariantClosed)))

end DynamicalSystemsInvolvingOneParameterCanonicalLaneLean
end HautevilleHouse