import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingOneParameterCanonicalLaneLean

structure NormalFormPackage where
  parameterValue : ℝ
  coordinateChange : ℝⁿ → ℝⁿ
  truncatedNormalForm : ℝⁿ → ℝⁿ
  resonanceConditions : Prop
  equivalenceTheorem : Prop

structure NormalFormEvidence (N : NormalFormPackage) where
  parameterValueClosed : N.parameterValue = 0
  coordinateChangeSmooth : Smooth N.coordinateChange
  truncatedNormalFormClosed : N.truncatedNormalForm = 0
  resonanceConditionsClosed : N.resonanceConditions
  equivalenceTheoremClosed : N.equivalenceTheorem

def NormalFormClosed (N : NormalFormPackage) : Prop :=
  N.parameterValue = 0 ∧ Smooth N.coordinateChange ∧
  N.truncatedNormalForm = 0 ∧ N.resonanceConditions ∧ N.equivalenceTheorem

theorem normal_form_closed_from_evidence
    (N : NormalFormPackage) (E : NormalFormEvidence N) :
    NormalFormClosed N := by
  exact And.intro E.parameterValueClosed
    (And.intro E.coordinateChangeSmooth
      (And.intro E.truncatedNormalFormClosed
        (And.intro E.resonanceConditionsClosed E.equivalenceTheoremClosed)))

end DynamicalSystemsInvolvingOneParameterCanonicalLaneLean
end HautevilleHouse
