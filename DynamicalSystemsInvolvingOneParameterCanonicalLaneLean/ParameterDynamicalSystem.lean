import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterCanonicalLaneLean

structure ParameterDynamicalSystem where
  stateSpace : Type u
  parameterSpace : Type v
  flow : parameterSpace → stateSpace → stateSpace
  continuousInParameter : Prop
  continuousInState : Prop
  semigroupProperty : Prop
  identityAtZero : Prop

structure ParameterDynamicalSystemEvidence (S : ParameterDynamicalSystem) where
  continuousInParameterClosed : S.continuousInParameter
  continuousInStateClosed : S.continuousInState
  semigroupPropertyClosed : S.semigroupProperty
  identityAtZeroClosed : S.identityAtZero

def ParameterDynamicalSystemClosed (S : ParameterDynamicalSystem) : Prop :=
  S.continuousInParameter ∧ S.continuousInState ∧
  S.semigroupProperty ∧ S.identityAtZero

theorem parameter_dynamical_system_closed_from_evidence
    (S : ParameterDynamicalSystem) (E : ParameterDynamicalSystemEvidence S) :
    ParameterDynamicalSystemClosed S := by
  exact And.intro E.continuousInParameterClosed
    (And.intro E.continuousInStateClosed
      (And.intro E.semigroupPropertyClosed E.identityAtZeroClosed))

end DynamicalSystemsInvolvingOneParameterCanonicalLaneLean
end HautevilleHouse
