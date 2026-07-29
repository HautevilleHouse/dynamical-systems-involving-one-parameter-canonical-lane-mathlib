import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterCanonicalLaneLean

structure InvariantManifoldPackage {F : OneParameterFlowPackage} where
  parameterValue : F.parameter
  manifold : Set (F.stateSpace × F.timeDomain)
  invarianceUnderFlow : Prop
  dimension : ℕ
  stability : Prop
  persistence : Prop

structure InvariantManifoldEvidence {F : OneParameterFlowPackage}
    (I : InvariantManifoldPackage F) where
  invarianceUnderFlowClosed : I.invarianceUnderFlow
  stabilityClosed : I.stability
  persistenceClosed : I.persistence

def InvariantManifoldClosed {F : OneParameterFlowPackage}
    (I : InvariantManifoldPackage F) : Prop :=
  I.invarianceUnderFlow ∧ I.stability ∧ I.persistence

theorem invariant_manifold_closed_from_evidence {F : OneParameterFlowPackage}
    (I : InvariantManifoldPackage F) (E : InvariantManifoldEvidence I) :
    InvariantManifoldClosed I := by
  exact And.intro E.invarianceUnderFlowClosed
    (And.intro E.stabilityClosed E.persistenceClosed)

end DynamicalSystemsInvolvingOneParameterCanonicalLaneLean
end HautevilleHouse