import { Alert, AlertIcon, AlertTitle, AlertDescription } from '@chakra-ui/react'

type AlertProps = {
    title?: string | '';
    description?: string | '';
    status?: 'info' | 'warning' | 'success' | 'error' | '';
}

const FlashMessage = (props : AlertProps) => {
  if (!props.description || !props.status) return null

  const { title, description, status = 'info' } = props
  return (
    <Alert flexDirection='column' mb={4} status={status}>
      <AlertIcon />
      {title && <AlertTitle>{title}</AlertTitle>}
      <AlertDescription>{description}</AlertDescription>
    </Alert>
  )
}

export default FlashMessage
