import { 
  FormControl, 
  FormHelperText, 
  FormLabel, 
  Input, 
  FormErrorMessage, 
  NumberInput, 
  NumberInputField, 
  NumberInputStepper, 
  NumberIncrementStepper, 
  NumberDecrementStepper 
} from "@chakra-ui/react";
import { FieldApi } from '@tanstack/react-form';

function FieldInfo({ field }: { field: FieldApi<any, any, any, any> }) {
  return (
    <>
      {field.state.meta.isTouched && field.state.meta.errors.length ? (
        <FormErrorMessage>
          <em>{field.state.meta.errors.join(',')}</em>
        </FormErrorMessage>
      ) : null}
      {field.state.meta.isValidating ? 'Validating...' : null}
    </>
  )
}
const ItemForm = ({ form } : {form: any}) => {
  return (
    <form>
      <form.Field
        name="description"
        validators={{
          onChange: ({ value }) =>
            !value
              ? 'A description is required'
              : value.length < 3
                ? 'Description must be at least 3 characters'
                : undefined,
        }}
        children={(field: any) => (
          <FormControl className="pb-2" isInvalid={field.state.meta.isTouched && !!field.state.meta.errors.length}>
            <FormLabel>Description</FormLabel>
            <Input
              name={field.name}
              value={field.state.value}
              onBlur={field.handleBlur}
              onChange={(e) => field.handleChange(e.target.value)}
            />
            <FieldInfo field={field} />
          </FormControl>
        )}
      />
      <form.Field
        name="weight"
        validators={{
          onChange: ({ value }) =>
            !value
              ? 'A weight is required'
              : (Number(value) < 1 || Number(value) > 10)
                ? 'Weight must be between 1 and 10'
                : undefined,
        }}
        children={(field: any) => (
          <FormControl className="pb-2" isInvalid={field.state.meta.isTouched && !!field.state.meta.errors.length}>
            <FormLabel>Weight</FormLabel>
            <NumberInput min={1} max={10} keepWithinRange>
              <NumberInputField 
                name={field.name}
                value={field.state.value}
                onBlur={field.handleBlur}
                onChange={(e) => field.handleChange(e.target.value)} 
              />
              <NumberInputStepper>
                <NumberIncrementStepper />
                <NumberDecrementStepper />
              </NumberInputStepper>
            </NumberInput>
            <FieldInfo field={field} />
            <FormHelperText>How important is this from a 1 - 10 scale with 10 being the most important</FormHelperText>
          </FormControl>
        )}
      />
    </form>
  )
}

export default ItemForm
